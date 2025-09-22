#include "keyboard.h"
#include "../interrupt_handlers.h"
#include <stdint.h>
#include "../asmfunctions.h"
#include "../libc_freestanding/string.h"
#include "../kernel.h"



uint8_t keybuffer[256];
uint8_t keybuffer_read_position = 0;
uint8_t keybuffer_write_position = 0;

void init_keyboard(){
    //todo share the interrupt hooks array properly


};

void keyboard_int_handler(){
    uint8_t scancode = inb(0x60);
    keybuffer_write(scancode);
    

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