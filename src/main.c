#include "libc_freestanding/string.h"
#include "asmfunctions.h"
#include "kernel.h"
#include "libc_freestanding/kmalloc.h"
#include "interrupt_handlers.h"
#include "scheduler.h"
#include "drivers/keyboard.h"
#include "vmem.h"
#include "libc_freestanding/mutex.h"
char* secondary_framebuffer;
char* primary_framebuffer;


void mutex_test_1();
void mutex_test_2();

void cmain() {


    

    
    _kprint("ENTERING MAIN.C\r\n\r\n");
    
    _kprint("\r\n");
    _kprint("MULTIBOOT_INFO_ADDR ");
    print_hex32((uint32_t)kglobals.MULTIBOOT_INFO_ADDR);
    _kprint("\r\nFRAMEBUFFER ");
    print_hex32(kglobals.FRAMEBUFFER);
    _kprint("\r\n");
    _kprint("FRAMEBUFFER_PITCH ");
    print_hex32(kglobals.FRAMEBUFFER_PITCH);
    _kprint("\r\n");
    _kprint("FRAMEBUFFER_WIDTH ");
    print_hex32(kglobals.FRAMEBUFFER_WIDTH);
    _kprint("\r\n");
    _kprint("FRAMEBUFFER_HEIGHT ");
    print_hex32(kglobals.FRAMEBUFFER_HEIGHT);
    _kprint("\r\n");
    _kprint("FRAMEBUFFER_BPP ");
    print_hex32(kglobals.FRAMEBUFFER_BPP);
    _kprint("\r\n");
    _kprint("FRAMEBUFFER_TYPE ");
    print_hex32(kglobals.FRAMEBUFFER_TYPE);
    _kprint("\r\n");
    
    _kprint("stack size: ");
    print_hex32(_get_stacksize());
    
    _kprint("\r\n");


    secondary_framebuffer = (char*)kmalloc_aligned(kglobals.FRAMEBUFFER_HEIGHT*kglobals.FRAMEBUFFER_PITCH,4096);
    //test_if_paging_catches_fire();
    //uint8_t* remapped_framebuffer = kmalloc_aligned(kglobals.FRAMEBUFFER_HEIGHT*kglobals.FRAMEBUFFER_PITCH,4096);
    //for(uint32_t i = 0; i < (kglobals.FRAMEBUFFER_HEIGHT*kglobals.FRAMEBUFFER_PITCH)>>12; i++){
    //    map_page(kglobals.FRAMEBUFFER + 4096*i, (uint32_t)remapped_framebuffer+4096*i, 3);
    //}
    //kglobals.FRAMEBUFFER = (uint32_t)remapped_framebuffer;
    primary_framebuffer = (char*)kglobals.FRAMEBUFFER;
    kglobals.FRAMEBUFFER = (uint32_t)secondary_framebuffer;




    _set_console_color(0);
    _kprint("GDT..");
    _set_console_color(7);
    _kprint("OK!\r\n");
    _set_console_color(0);
    _kprint("IDT..");
    _set_console_color(7);
    _kprint("OK!\r\n\n");
    
    _set_console_color(0);



    char* teststring = "TESTING A STRING!";
    
    uint32_t teststr_len = strlen(teststring);

    print_hex32(teststr_len);

    char* newstr = kmalloc(teststr_len+1);
    
    _kprint("\r\n");
    
    memcpy(newstr, teststring, teststr_len+1);
    
    char* teststring2 = "SNAILS!!!";
    char* newstring2 = kmalloc(strlen(teststring2)+1);
    memcpy(newstring2,teststring2,strlen(teststring2));
    
    
    _kprint(newstring2);
    _kprint("\r\n");
    print_hex32((uint32_t)teststring2);
    _kprint("\r\n");
    print_hex32((uint32_t)newstring2);
    _kprint("\r\n");
    _kprint(newstr);
    _kprint("\r\n");
    print_hex32((uint32_t)teststring);
    _kprint("\r\n");
    print_hex32((uint32_t)newstr);
    
    _kprint("\r\n");
    _kprint("\r\n");
    _kprint("\r\n");
    _kprint("\r\n");
    _kprint("\r\n");

    _kprint("!\\\"#$%&'()*+,-./0123456789:;<=>?@ABCDE\r\nFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");

    //_kprint("\r\n\r\nI forgot how this goes.. The quick brown Frog jumps over the lazy Fox?\r\n");
    _kprint("\r\n\r\nI forgot how this goes.. The quick brown frog jumps over the lazy fox?\r\n");

    

    fill_interrupts();
    

    init_scheduler();
    init_keyboard();
    //create_task((uint32_t)example_task_1);
    //create_task((uint32_t)example_task_2);
    
    
    create_task((uint32_t)heartbeat);
    //create_task((uint32_t)mutex_test_1);
    //create_task((uint32_t)mutex_test_2);
    create_task((uint32_t)refresh_screen_task);
    enable_interrupts();
    
    
    //kmalloc_torture_test();
    
    
    //panic(0);
    sched_main_loop();
    
    

}


mutex testlock = 0;
uint32_t testvalue = 0;

void mutex_test_1(){
    while(1){
        
        lock_mutex(&testlock);

        uint32_t old_testvalue = testvalue;
        
        testvalue++;
        sleep(10);
        if(old_testvalue+1 != testvalue){
            _kprint("Mutex test failed! value changed");
        }        
        release_mutex(&testlock);

    }
}

void mutex_test_2(){
    while(1){
        lock_mutex(&testlock);
        uint32_t old_testvalue = testvalue;
        testvalue++;
        sleep(0);
        if(old_testvalue+1 != testvalue){
            _kprint("Mutex test failed! value changed");
        }        
        release_mutex(&testlock);
    }
}






void heartbeat(){
    while(1) {
        //_kprint("\r\n");
        //wait_for_key();
          

        //uint8_t pressed[] = {keybuffer_read(),0};
        sleep(25);
        print_hex32(inb(0x3F8));
        //_kprint(pressed);
        

        //_kprint(" time: ");
        //print_hex32((kglobals.KERNEL_TIME));
        
        //sleep(100);
        //_console_render();
        //copy_framebuffer();
        //_blank_screen();
    
    }
 }


void scroll_console(){
    memmove(kglobals.CONSOLE_BUFFER, kglobals.CONSOLE_BUFFER + (kglobals.CONSOLE_COLUMNS*2), (kglobals.CONSOLE_ROWS*kglobals.CONSOLE_COLUMNS*2));
    
}




void scroll_framebuffer(){

    memcpy_4byte(primary_framebuffer, primary_framebuffer + kglobals.FRAMEBUFFER_PITCH , kglobals.FRAMEBUFFER_PITCH*(kglobals.FRAMEBUFFER_HEIGHT-1));
}

void copy_framebuffer(){
    //for(uint32_t i = 0; i < (kglobals.FRAMEBUFFER_HEIGHT*kglobals.FRAMEBUFFER_PITCH) >> 12; i++){
    //    if(get_page_flags(((uint32_t)secondary_framebuffer+i*4096))& 0b1000000){
    //        _print_hex_serial(get_page_flags(((uint32_t)secondary_framebuffer+i*4096)));
    //        clear_dirty_flag((uint32_t)secondary_framebuffer+i*4096);
    //        memcpy_4byte(primary_framebuffer+i*4096, secondary_framebuffer+i*4096,4096);
    //    } 
    //    
    //}

    memcpy_4byte(primary_framebuffer,secondary_framebuffer,kglobals.FRAMEBUFFER_HEIGHT*kglobals.FRAMEBUFFER_PITCH);

}
uint32_t get_line_length(uint32_t line){

    return line;

}

uint8_t random_seed = 8;
//uint8_t random_bytes[256] = {52,158,135,33,233,88,218,143,64,15,103,55,6,209,15,107,178,126,59,62,173,171,89,92,213,34,214,95,48,9,138,118,171,164,180,42,75,91,42,132,85,244,168,252,98,2,154,57,44,144,99,109,118,57,57,203,25,4,213,106,22,194,169,139,32,70,251,141,220,22,16,0,119,212,134,143,186,219,12,195,45,55,79,77,138,87,91,22,208,183,142,113,79,236,216,149,163,25,10,14,240,171,234,201,129,154,197,201,207,155,31,111,10,254,223,203,41,18,113,237,75,250,223,116,114,53,23,22,2,124,100,56,27,252,241,131,254,101,40,201,175,51,102,52,62,7,135,36,130,57,44,213,66,43,212,146,228,198,12,12,156,93,86,13,207,146,199,39,126,152,165,61,35,136,189,13,235,66,131,158,53,33,60,117,217,121,228,241,222,251,121,213,17,208,25,49,165,110,198,227,83,184,104,185,101,107,186,188,76,200,227,210,90,92,115,84,3,50,70,225,139,157,162,70,228,111,106,55,198,10,172,254,190,117,93,18,118,148,227,130,12,174,222,144,149,112,202,82,131,1,233,134,59,60,233,69};
uint8_t random_bytes[256] = {52,38,196,32,34,56,120,254,176,98,2,126,229,216,100,238,13,236,28,158,167,137,240,125,78,241,228,182,62,160,91,134,129,105,25,110,230,60,50,151,11,107,90,57,21,68,49,153,102,246,40,139,235,80,221,185,83,70,186,0,249,67,212,37,64,225,6,208,175,177,144,121,124,239,166,170,156,226,14,130,162,82,72,30,47,85,147,197,15,193,23,192,234,205,113,200,172,232,16,127,161,39,108,31,19,138,63,84,73,255,165,136,44,65,154,20,119,168,187,41,77,132,222,36,81,178,4,253,46,179,237,189,87,173,93,148,199,114,94,195,106,201,180,75,69,181,55,79,248,123,174,104,159,143,149,150,242,131,231,3,74,191,116,48,88,7,45,210,53,183,141,194,244,164,190,218,103,43,58,214,169,198,209,155,250,224,117,1,133,99,171,71,118,95,54,247,163,251,10,22,12,215,89,217,33,252,101,188,35,112,17,233,140,27,157,111,128,220,203,59,206,96,92,76,97,227,184,26,207,223,24,152,5,51,219,42,204,202,122,86,243,8,109,29,66,213,146,145,135,115,18,245,211,61,142,9};
uint8_t random_byte(){
    random_seed += random_bytes[random_seed];
    return random_seed;

}

