#include "libc_freestanding/string.h"
#include "asmfunctions.h"
#include "kernel.h"
#include "libc_freestanding/kmalloc.h"
#include "interrupt_handlers.h"
#include "scheduler.h"
#include "drivers/keyboard.h"

char* secondary_framebuffer;
char* primary_framebuffer;
uint8_t random_byte();

void cmain() {


    

    
    _kprint("ENTERING MAIN.C\r\n\r\n");
    
    _kprint("\r\n");
    _kprint("FRAMEBUFFER ");
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

    secondary_framebuffer = (char*)kmalloc(kglobals.FRAMEBUFFER_HEIGHT*kglobals.FRAMEBUFFER_PITCH);
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
    _kprint("\r\n\r\nI forgot how this goes.. The quick brown fox jumps over the lazy fox?\r\n");

    

    fill_interrupts();
    

    init_scheduler();
    init_keyboard();
    //create_task((uint32_t)example_task_1);
   //create_task((uint32_t)example_task_2);
   
   create_task((uint32_t)refresh_screen_task);
   create_task((uint32_t)heartbeat);
    enable_interrupts();



    //panic(0);
    sched_main_loop();
    
    

}
void heartbeat(){
        uint32_t testnum = 0;
    while(1) {
        _kprint("\r\n");
        //wait_for_key();

        void* allocated = kmalloc(320000);
        //kfree(allocated);
    

        //uint8_t pressed[] = {keybuffer_read(),0};
        print_hex32(keybuffer_read());
        //_kprint(pressed);

        //print_hex32(random_byte());
        _kprint(" time: ");
        print_hex32((kglobals.KERNEL_TIME));
        
        //sleep(100);
        //_console_render();
        //copy_framebuffer();
        //_blank_screen();
        testnum++;

    
    }
 }
void console_render_partial(){
    //for(uint32_t i; i < kglobals.CONSOLE_ROWS)
    
    memcpy_4byte(secondary_framebuffer, secondary_framebuffer + kglobals.FRAMEBUFFER_PITCH*kglobals.CHARACTER_HEIGHT*2, kglobals.FRAMEBUFFER_PITCH*(kglobals.FRAMEBUFFER_HEIGHT-1));
    _console_render_line(kglobals.CONSOLE_CURRENT_ROW);
}


void scroll_console(){
    memmove(kglobals.CONSOLE_BUFFER, kglobals.CONSOLE_BUFFER + (kglobals.CONSOLE_COLUMNS*2), (kglobals.CONSOLE_ROWS*kglobals.CONSOLE_COLUMNS*2));
    for(int i = 0; i < 10; i++){
        //scroll_framebuffer();
    }
}




void scroll_framebuffer(){
    memcpy_4byte(primary_framebuffer, primary_framebuffer + kglobals.FRAMEBUFFER_PITCH, kglobals.FRAMEBUFFER_PITCH*(kglobals.FRAMEBUFFER_HEIGHT-1));
}

void copy_framebuffer(){
    memcpy_4byte(primary_framebuffer,secondary_framebuffer,kglobals.FRAMEBUFFER_HEIGHT*kglobals.FRAMEBUFFER_PITCH);

}
uint32_t get_line_length(uint32_t line){



}

uint8_t random_seed = 8;
uint8_t random_bytes[256] = {52,158,135,33,233,88,218,143,64,15,103,55,6,209,15,107,178,126,59,62,173,171,89,92,213,34,214,95,48,9,138,118,171,164,180,42,75,91,42,132,85,244,168,252,98,2,154,57,44,144,99,109,118,57,57,203,25,4,213,106,22,194,169,139,32,70,251,141,220,22,16,0,119,212,134,143,186,219,12,195,45,55,79,77,138,87,91,22,208,183,142,113,79,236,216,149,163,25,10,14,240,171,234,201,129,154,197,201,207,155,31,111,10,254,223,203,41,18,113,237,75,250,223,116,114,53,23,22,2,124,100,56,27,252,241,131,254,101,40,201,175,51,102,52,62,7,135,36,130,57,44,213,66,43,212,146,228,198,12,12,156,93,86,13,207,146,199,39,126,152,165,61,35,136,189,13,235,66,131,158,53,33,60,117,217,121,228,241,222,251,121,213,17,208,25,49,165,110,198,227,83,184,104,185,101,107,186,188,76,200,227,210,90,92,115,84,3,50,70,225,139,157,162,70,228,111,106,55,198,10,172,254,190,117,93,18,118,148,227,130,12,174,222,144,149,112,202,82,131,1,233,134,59,60,233,69};
uint8_t random_byte(){
    random_seed += random_bytes[random_seed];
    return random_seed;

}

