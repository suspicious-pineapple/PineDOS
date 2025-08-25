#include "libc/string.h"
#include "asmfunctions.h"
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

    memcpy(str1+1,str2+1,10);
    _kprint(str1);

    _kprint("Frogs?\r\n");

    //_kprint("ABCDEFGHIJKLMNOPQRSTUVWXYZ\r\n");
    //_kprint("abcdefghijklmnopqrstuvw @@@@ _@_v");

    //memcpy(&str1,&str2,5);
    /*
    _outb(0x3F8,'F');
    _outb(0x3F8,'r');
    _outb(0x3F8,'o');
    _outb(0x3F8,'g');
    _outb(0x3F8,'s');
    */
}

void scroll_console(){
    memmove(CONSOLE_BUFFER, CONSOLE_BUFFER+(69*2), 42*69*2);

}
