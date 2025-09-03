#include "libc_freestanding/string.h"
#include "asmfunctions.h"
#include "kernel.h"
#include "libc_freestanding/kmalloc.h"



char* secondary_framebuffer;
char* primary_framebuffer;


void cmain() {




    
    _kprint("entering main.c\r\n\r\n");
    
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
    _kprint("whatever grub sets by default lmao\r\n");
    _set_console_color(0);
    _kprint("IDT..");
    _set_console_color(7);
    _kprint("not implemented yet lol\r\n\n");
    
    _set_console_color(0);



    char* teststring = "Testing a string!";
    
    uint32_t teststr_len = strlen(teststring);

    print_hex32(teststr_len);

    char* newstr = kmalloc(teststr_len+1);
    
    _kprint("\r\n");
    
    memcpy(newstr, teststring, teststr_len+1);
    
    char* teststring2 = "Snails!!";
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
    _kprint("\r\n");
    _kprint("\r\n");
    _kprint("\r\n");
    _kprint("\r\n");

    
    _kprint("!\\\"#$%&'()*+,-./0123456789:;<=>?@ABCDE\r\nFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~");




    

    uint32_t testnum = 0x12345;
    while(1) {
        _kprint("\r\n");
        print_hex32(testnum);
        testnum++;

        _console_render();
        copy_framebuffer();
        _blank_screen();
    
    }
 

}



void scroll_console(){
    memmove(kglobals.CONSOLE_BUFFER, kglobals.CONSOLE_BUFFER + (69*2), (38*69*2));
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