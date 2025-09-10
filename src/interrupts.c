#include <stdint.h>
#include "kernel.h"
#include "interrupt_handlers.h"
#include "asmfunctions.h"
#include "libc_freestanding/string.h"
#include "scheduler.h"


void default_interrupt(){
    //disable_interrupts();
    _kprint("Received some kind of interrupt!\r\n");
    _console_render();
   
}



void* interrupt_hooks[255] = {0};
    void testHook(uint32_t isr){
        _kprint("\r\nhook works! received ISR:");
        print_hex32(isr);
        _kprint("\r\n");
        _console_render();
        copy_framebuffer();


    }
    void yieldHook(uint32_t isr){
        _kprint("\r\nentering yielding interrupt handler");
        print_hex32(isr);
        _kprint("\r\n");
        yield();
        _kprint("\r\nexiting yielding interrupt handler\r\n");
    }
void fill_interrupts(){

    load_interrupts();
    //for(uint16_t i=1; i<50; i++){
    //    set_isr((uint32_t)default_interrupt,(uint8_t)i);
    //}
    
    set_isr((uint32_t)generic_isr_1,(uint16_t)1);
    set_isr((uint32_t)generic_isr_2,(uint16_t)2);
    set_isr((uint32_t)generic_isr_3,(uint16_t)3);
    set_isr((uint32_t)generic_isr_4,(uint16_t)4);
    set_isr((uint32_t)generic_isr_5,(uint16_t)5);
    set_isr((uint32_t)generic_isr_6,(uint16_t)6);
    set_isr((uint32_t)generic_isr_7,(uint16_t)7);
    set_isr((uint32_t)generic_isr_8,(uint16_t)8);
    set_isr((uint32_t)generic_isr_9,(uint16_t)9);
    set_isr((uint32_t)generic_isr_10,(uint16_t)10);
    set_isr((uint32_t)generic_isr_11,(uint16_t)11);
    set_isr((uint32_t)generic_isr_12,(uint16_t)12);
    set_isr((uint32_t)generic_isr_13,(uint16_t)13);
    set_isr((uint32_t)generic_isr_14,(uint16_t)14);
    set_isr((uint32_t)generic_isr_15,(uint16_t)15);
    set_isr((uint32_t)generic_isr_16,(uint16_t)16);
    set_isr((uint32_t)generic_isr_17,(uint16_t)17);
    set_isr((uint32_t)generic_isr_18,(uint16_t)18);
    set_isr((uint32_t)generic_isr_19,(uint16_t)19);
    set_isr((uint32_t)generic_isr_20,(uint16_t)20);
    set_isr((uint32_t)generic_isr_21,(uint16_t)21);
    set_isr((uint32_t)generic_isr_22,(uint16_t)22);
    set_isr((uint32_t)generic_isr_23,(uint16_t)23);
    set_isr((uint32_t)generic_isr_24,(uint16_t)24);
    set_isr((uint32_t)generic_isr_25,(uint16_t)25);
    set_isr((uint32_t)generic_isr_26,(uint16_t)26);
    set_isr((uint32_t)generic_isr_27,(uint16_t)27);
    set_isr((uint32_t)generic_isr_28,(uint16_t)28);
    set_isr((uint32_t)generic_isr_29,(uint16_t)29);
    set_isr((uint32_t)generic_isr_30,(uint16_t)30);
    set_isr((uint32_t)generic_isr_31,(uint16_t)31);
    set_isr((uint32_t)generic_isr_32,(uint16_t)33);
    set_isr((uint32_t)generic_isr_34,(uint16_t)33);
    set_isr((uint32_t)generic_isr_35,(uint16_t)35);
    set_isr((uint32_t)generic_isr_36,(uint16_t)36);
    set_isr((uint32_t)generic_isr_37,(uint16_t)37);
    set_isr((uint32_t)generic_isr_38,(uint16_t)38);
    set_isr((uint32_t)generic_isr_39,(uint16_t)39);
    set_isr((uint32_t)generic_isr_40,(uint16_t)40);
    set_isr((uint32_t)generic_isr_41,(uint16_t)41);
    set_isr((uint32_t)generic_isr_42,(uint16_t)42);
    set_isr((uint32_t)generic_isr_43,(uint16_t)43);
    set_isr((uint32_t)generic_isr_44,(uint16_t)44);
    set_isr((uint32_t)generic_isr_45,(uint16_t)45);
    set_isr((uint32_t)generic_isr_46,(uint16_t)46);
    set_isr((uint32_t)generic_isr_47,(uint16_t)47);
    set_isr((uint32_t)generic_isr_48,(uint16_t)48);
    set_isr((uint32_t)generic_isr_49,(uint16_t)49);

    //enable_interrupts();
    //disable_interrupts();



    interrupt_hooks[49]=&testHook;
    interrupt_hooks[34]=&yieldHook;

    init_irq();

    trigger_int();
    trigger_int();
    //print_hex32(25/0);
    //while(1){};
    //test1();
}

static inline void io_wait(void)
{
    outb(0x80, 0);
}






void handle_interrupt(uint32_t isr){
    if(interrupt_hooks[isr]!=0){
        int (*hookFunc)(uint32_t isr) = interrupt_hooks[isr];
        hookFunc(isr);

        return;
    } else {

    _kprint("\r\nUnhandled interrupt received: ");
    print_hex32(isr);
    _kprint("\r\n");
    _console_render();
    copy_framebuffer();
    _blank_screen();
    }
}

void end_irq(uint8_t irq){
    	if(irq>=8){
            outb(PIC2_COMMAND, PIC_EOI);
        }
        outb(PIC1_COMMAND, PIC_EOI);
}

void init_irq(){

}