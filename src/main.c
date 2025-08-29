#include "libc_freestanding/string.h"
#include "asmfunctions.h"
#include "kernel.h"
void cmain() {

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





    char str2[] = "F9876543210F.\r\n";
    char str1[] = "D0123456789D.\r\n";
    
    /*
    memcpy(str1+5, str1+3,3);
    _kprint(str1);
    char str2[] = "0123456789.\r\n";
    memmove(str2+5, str2+3,3);
    _kprint(str2);
    */

    memcpy(str1,str2,10);
    //memset(&str1, 'F', 6);
    _kprint(str1);

    _kprint("Frogs?\r\n");


    memcmp(str1,str2,4)==0 ? _kprint("They are equal") : _kprint("They are not equal");

    for(int i = 0; i < 8; i++){
        _kprint("\r\n");
        print_hex32(i);

    }

    volatile uint32_t runtest(uint32_t depth);

    runtest(0);


    _kprint("\r\n");
    _kprint("\r\n");
    
    char hexstr[11];
    hex32_to_ascii(hexstr, 0x12345678);
    _kprint(hexstr);
    _kprint("\r\n");
    _kprint("AAAAAAAAAAAAAAAAAAAA");
    _kprint("BBBBBBBBBBBBBBBBBBBB");
    _kprint("CCCCCCCCCCCCCCCCCCCC");
    _kprint("DDDDDDDDDDDDDDDDDDDD");
    _kprint("EEEEEEEEEEEEEEEEEEEE");
    _kprint("FFFFFFFFFFFFFFFFFFFF");
    _kprint("\r\n");
    //_kprint("abcdefghijklmnopqrstuvw @@@@ _@_v");

    //memcpy(&str1,&str2,5);
    /*
    _outb(0x3F8,'F');
    _outb(0x3F8,'r');
    _outb(0x3F8,'o');
    _outb(0x3F8,'g');
    _outb(0x3F8,'s');
    */
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
   
    if(depth>12){
        return 0;
    }

    runtest(depth+1);



    return 0;
}



void scroll_console(){
    memmove(CONSOLE_BUFFER, CONSOLE_BUFFER + (69*2), (42*69*2));
}
