#include <stdint.h>
#include "kernel.h"
#include "interrupt_handlers.h"
#include "asmfunctions.h"


struct interrupt_frame;

void default_interrupt(){
    _kprint("Received some kind of interrupt!\r\n");
    _console_render();
    while(1);

}


void keyboard_interrupt(){
    _kprint("Received keyboard interrupt!\r\n");

}

void default_interrupt_c(){
    default_interrupt();
}




void do_interrupt_stuff();
void fill_interrupts(){
    do_interrupt_stuff();
    
    _enable_interrupts();
}

__attribute__((noreturn)) void exception_handler(void);
void exception_handler() {
    __asm__ volatile ("cli; hlt"); // Completely hangs the computer
}
//shamelessly copy from osdev wiki becasuse im desperate

typedef struct {
	uint16_t    isr_low;      // The lower 16 bits of the ISR's address
	uint16_t    kernel_cs;    // The GDT segment selector that the CPU will load into CS before calling the ISR
	uint8_t     reserved;     // Set to zero
	uint8_t     attributes;   // Type and attributes; see the IDT page
	uint16_t    isr_high;     // The higher 16 bits of the ISR's address
} __attribute__((packed)) idt_entry_t;


__attribute__((aligned(0x10))) static idt_entry_t idt[256];

typedef struct {
	uint16_t	limit;
	uint32_t	base;
} __attribute__((packed)) idtr_t;

static idtr_t idtr;

void idt_set_descriptor(uint8_t vector, void* isr, uint8_t flags);
void idt_set_descriptor(uint8_t vector, void* isr, uint8_t flags) {
    idt_entry_t* descriptor = &idt[vector];

    descriptor->isr_low        = (uint32_t)isr & 0xFFFF;
    descriptor->kernel_cs      = 0x08; // this value can be whatever offset your kernel code selector is in your GDT
    descriptor->attributes     = flags;
    descriptor->isr_high       = (uint32_t)isr >> 16;
    descriptor->reserved       = 0;
}

static bool vectors[32];

extern void* isr_stub_table[];

void idt_init(void);
void idt_init() {
    idtr.base = (uintptr_t)&idt[0];
    idtr.limit = (uint16_t)sizeof(idt_entry_t) * 33 - 1;

    for (uint8_t vector = 0; vector < 33; vector++) {
        idt_set_descriptor(vector, isr_stub_table[vector], 0x8E);
        vectors[vector] = true;
    }

    __asm__ volatile ("lidt %0" : : "m"(idtr)); // load the new IDT
    __asm__ volatile ("sti"); // set the interrupt flag
}

void do_interrupt_stuff(){
    //for(uint8_t i = 0; i < 32; i++){
    //    idt_set_descriptor(i, exception_handler, 0x8E);

    //}

    idt_init();

}