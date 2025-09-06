#include <stdint.h>
#include "kernel.h"
#include "interrupt_handlers.h"
#include "asmfunctions.h"



void default_interrupt(){
    //disable_interrupts();
    _kprint("Received some kind of interrupt!\r\n");
    _console_render();
    while(1){};
   
}




void fill_interrupts(){

    load_interrupts();
    for(uint16_t i=1; i<50; i++){
        set_isr((uint32_t)default_interrupt,(uint8_t)i);
    }

    //enable_interrupts();
    //disable_interrupts();
    trigger_int();
    //while(1){};
    //test1();
}




