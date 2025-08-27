#include <stdint.h>
#include "kernel.h"








void set_interrupt(uint8_t entry, uint32_t pointer){
    
}

void fill_interrupts(){
    for(uint8_t i; i<255;i++){
        set_interrupt(i,default_interrupt);
    }
}



void default_interrupt(){


}










