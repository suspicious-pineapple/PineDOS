#include "asmfunctions.h"
void cmain() {

    _kprint("entering main.c\r\n");


    char* str1 = "Snails\r\n";
    char str2[] = "Frogs\r\n";

    _set_console_color(0);
    _kprint(str1);
    _set_console_color(1);
    _kprint(str1);
    _set_console_color(2);
    _kprint(str1);
    _set_console_color(3);
    _kprint(str1);
    _set_console_color(4);
    _kprint(str2);
    _kprint(str1);
    _kprint(str1);
    
    
    //memcpy(&str1,&str2,5);

    /*
    _outb(0x3F8,'F');
    _outb(0x3F8,'r');
    _outb(0x3F8,'o');
    _outb(0x3F8,'g');
    _outb(0x3F8,'s');
    */
}

