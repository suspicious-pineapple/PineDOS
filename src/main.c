#include "libc_freestanding/string.h"
#include "asmfunctions.h"
#include "kernel.h"
void cmain() {

    _kprint("entering main.c\r\n\r\n");


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
    _kprint(str1);

    _kprint("Frogs?\r\n");

    
    memcmp(str1,str2,4)==0 ? _kprint("They are equal") : _kprint("They are not equal");



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
    _console_render();
    
   volatile uint32_t test = 0;
    volatile uint32_t test2 = 0;
    while(1){
        
        char hexstr[11];
        hex32_to_ascii(hexstr, test);
        _kprint(hexstr);
        _kprint("\r\n");

        
         for(uint32_t j = 0; j < 50000;j++){
            
        for(uint32_t k = 0; k < 500;k++){
            test2++;
            test2++;
        }

        }


        test++;
        
        _blank_screen();
        _console_render();

    }
    





}

void scroll_console(){
    memmove(&CONSOLE_BUFFER, &CONSOLE_BUFFER + (69*2), (42*69*2));

}
