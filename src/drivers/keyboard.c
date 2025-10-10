#include "keyboard.h"
#include "../interrupt_handlers.h"
#include <stdint.h>
#include <stdbool.h>
#include "../asmfunctions.h"
#include "../libc_freestanding/string.h"
#include "../kernel.h"
#include "../scheduler.h"



char scanCodeToAscii_lowercase[256];
char scanCodeToAscii_uppercase[256];





uint8_t keybuffer[256];
uint8_t pressed_keys[256];
uint8_t keybuffer_read_position = 0;
uint8_t keybuffer_write_position = 0;
bool shiftstate = 0;


void init_keyboard(){
    //todo share the interrupt hooks array properly

    scanCodeToAscii_lowercase[0x1E]='a';
    scanCodeToAscii_lowercase[0x30]='b';
    scanCodeToAscii_lowercase[0x2e]='c';
    scanCodeToAscii_lowercase[0x20]='d';
    scanCodeToAscii_lowercase[0x12]='e';
    scanCodeToAscii_lowercase[0x21]='f';
    scanCodeToAscii_lowercase[0x22]='g';
    scanCodeToAscii_lowercase[0x23]='h';
    scanCodeToAscii_lowercase[0x17]='i';
    scanCodeToAscii_lowercase[0x24]='j';
    scanCodeToAscii_lowercase[0x25]='k';
    scanCodeToAscii_lowercase[0x26]='l';
    scanCodeToAscii_lowercase[0x32]='m';
    scanCodeToAscii_lowercase[0x31]='n';
    scanCodeToAscii_lowercase[0x18]='o';
    scanCodeToAscii_lowercase[0x19]='p';
    scanCodeToAscii_lowercase[0x10]='q';
    scanCodeToAscii_lowercase[0x13]='r';
    scanCodeToAscii_lowercase[0x1F]='s';
    scanCodeToAscii_lowercase[0x14]='t';
    scanCodeToAscii_lowercase[0x16]='u';
    scanCodeToAscii_lowercase[0x2F]='v';
    scanCodeToAscii_lowercase[0x11]='w';
    scanCodeToAscii_lowercase[0x2D]='x';
    scanCodeToAscii_lowercase[0x2c]='y';
    scanCodeToAscii_lowercase[0x15]='z';
    scanCodeToAscii_lowercase[0x02]='1';
    scanCodeToAscii_lowercase[0x03]='2';
    scanCodeToAscii_lowercase[0x04]='3';
    scanCodeToAscii_lowercase[0x05]='4';
    scanCodeToAscii_lowercase[0x06]='5';
    scanCodeToAscii_lowercase[0x07]='6';
    scanCodeToAscii_lowercase[0x08]='7';
    scanCodeToAscii_lowercase[0x09]='8';
    scanCodeToAscii_lowercase[0x0A]='9';
    scanCodeToAscii_lowercase[0x0B]='0';
    scanCodeToAscii_lowercase[0x39]=' ';
    scanCodeToAscii_lowercase[0x0F]='\t';
    scanCodeToAscii_lowercase[0x1C]='\r';
    scanCodeToAscii_lowercase[0x33]=',';
    scanCodeToAscii_lowercase[0x34]='.';
    scanCodeToAscii_lowercase[0x35]='-';
    scanCodeToAscii_lowercase[0x2B]='#';
    scanCodeToAscii_lowercase[0x56]='<';
    scanCodeToAscii_lowercase[0x29]='^';


    scanCodeToAscii_uppercase[0x1E]='A';
    scanCodeToAscii_uppercase[0x30]='B';
    scanCodeToAscii_uppercase[0x2e]='C';
    scanCodeToAscii_uppercase[0x20]='D';
    scanCodeToAscii_uppercase[0x12]='E';
    scanCodeToAscii_uppercase[0x21]='F';
    scanCodeToAscii_uppercase[0x22]='G';
    scanCodeToAscii_uppercase[0x23]='H';
    scanCodeToAscii_uppercase[0x17]='I';
    scanCodeToAscii_uppercase[0x24]='J';
    scanCodeToAscii_uppercase[0x25]='K';
    scanCodeToAscii_uppercase[0x26]='L';
    scanCodeToAscii_uppercase[0x32]='M';
    scanCodeToAscii_uppercase[0x31]='N';
    scanCodeToAscii_uppercase[0x18]='O';
    scanCodeToAscii_uppercase[0x19]='P';
    scanCodeToAscii_uppercase[0x10]='Q';
    scanCodeToAscii_uppercase[0x13]='R';
    scanCodeToAscii_uppercase[0x1F]='S';
    scanCodeToAscii_uppercase[0x14]='T';
    scanCodeToAscii_uppercase[0x16]='U';
    scanCodeToAscii_uppercase[0x2F]='V';
    scanCodeToAscii_uppercase[0x11]='W';
    scanCodeToAscii_uppercase[0x2D]='X';
    scanCodeToAscii_uppercase[0x2c]='Y';
    scanCodeToAscii_uppercase[0x15]='Z';
    scanCodeToAscii_uppercase[0x02]='!';
    scanCodeToAscii_uppercase[0x03]='"';
//    scanCodeToAscii_uppercase[0x04]='§';
    scanCodeToAscii_uppercase[0x05]='$';
    scanCodeToAscii_uppercase[0x06]='%';
    scanCodeToAscii_uppercase[0x07]='&';
    scanCodeToAscii_uppercase[0x08]='/';
    scanCodeToAscii_uppercase[0x09]='(';
    scanCodeToAscii_uppercase[0x0A]=')';
    scanCodeToAscii_uppercase[0x0B]='=';
    scanCodeToAscii_uppercase[0x39]=' ';
    scanCodeToAscii_uppercase[0x0F]='\t';
    scanCodeToAscii_uppercase[0x1C]='\r';
    scanCodeToAscii_uppercase[0x33]=';';
    scanCodeToAscii_uppercase[0x34]=':';
    scanCodeToAscii_uppercase[0x35]='_';
    scanCodeToAscii_uppercase[0x2B]='\'';
    scanCodeToAscii_uppercase[0x56]='>';
//    scanCodeToAscii_uppercase[0x29]='°';








};



void keyboard_int_handler(){
    interrupted=1;
    unsigned char scancode = inb(0x60);
    if(scancode==0xE0){return;};

    
    if(scancode & 0b10000000) { //key release
        pressed_keys[scancode & 0b01111111] = 0;
        return;
    } else {
        pressed_keys[scancode] = 1;
    }

    shiftstate = pressed_keys[0x2A];
    unsigned char decoded = 0;

    if(shiftstate && scanCodeToAscii_uppercase[scancode]!=0){
        decoded = scanCodeToAscii_uppercase[scancode];
    } else {
        decoded = scanCodeToAscii_lowercase[scancode];
    }
    keybuffer_write(decoded);
    interrupted=0;
}


uint8_t keybuffer_read(){
    uint8_t return_val = 0;
    if(keybuffer_read_position!=keybuffer_write_position){
        return_val = keybuffer[keybuffer_read_position++];
    }
    return return_val;
}
void keybuffer_write(uint8_t key){
    keybuffer[keybuffer_write_position++] = key;
    if(keybuffer_write_position==keybuffer_read_position){
        keybuffer_read_position++;
    }
}
int check_keybuffer(){
    return keybuffer_read_position!=keybuffer_write_position;
}