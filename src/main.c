#include "libc_freestanding/string.h"
#include "asmfunctions.h"
#include "kernel.h"
#include "libc_freestanding/kmalloc.h"
void cmain() {


    /*
    _kprint("entering main.c\r\n\r\n");
    
    _kprint("\r\n");
    _kprint("FRAMEBUFFER ");
    print_hex32(FRAMEBUFFER);
    _kprint("\r\n");
    _kprint("FRAMEBUFFER_PITCH ");
    print_hex32(FRAMEBUFFER_PITCH);
    _kprint("\r\n");
    _kprint("FRAMEBUFFER_WIDTH ");
    print_hex32(FRAMEBUFFER_WIDTH);
    _kprint("\r\n");
    _kprint("FRAMEBUFFER_HEIGHT ");
    print_hex32(FRAMEBUFFER_HEIGHT);
    _kprint("\r\n");
    _kprint("FRAMEBUFFER_BPP ");
    print_hex32(FRAMEBUFFER_BPP);
    _kprint("\r\n");
    _kprint("FRAMEBUFFER_TYPE ");
    print_hex32(FRAMEBUFFER_TYPE);
    _kprint("\r\n");
    
    _kprint("stack size: ");
    print_hex32(_get_stacksize());
    
    _kprint("\r\n");

    */


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




    _console_render();



 

}

volatile uint32_t runtest(uint32_t depth){
        _kprint("\r\n");

        _kprint("stack size: ");
    
    

    //char hexstr[12];
    //hex32_to_ascii(hexstr, _get_stacksize());
    //_kprint(hexstr);
    
    //print_hex32(_get_stacksize());
    print_hex32(_get_stacksize());
    _kprint("\r\n");
    print_hex32(depth);
    _kprint("\r\n");
   
    if(depth>8){
        return 0;
    }

    uint32_t retval = runtest(depth+1);

    print_hex32(retval);

    return 0;
}



void scroll_console(){
    memmove(CONSOLE_BUFFER, CONSOLE_BUFFER + (69*2), (38*69*2));
}
