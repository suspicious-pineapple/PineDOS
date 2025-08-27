#include <stdint.h>
#include "kernel.h"



struct interrupt_frame;

void default_interrupt(void *frame){
    _kprint("Received some kind of interrupt!\r\n");

}


void keyboard_interrupt(void *frame){
    _kprint("Received keyboard interrupt!\r\n");

}





void set_interrupt(uint8_t entry, uint32_t pointer){
    
}

void fill_interrupts(){
    for(uint8_t i=0; i<255;i++){
        set_interrupt(i,(uint32_t) &default_interrupt);
    }
    set_interrupt(1,(uint32_t)&keyboard_interrupt);

}






