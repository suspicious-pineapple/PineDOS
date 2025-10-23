#include <stdint.h>
#include "kernel.h"
#include "interrupt_handlers.h"
#include "asmfunctions.h"
#include "libc_freestanding/string.h"
#include "scheduler.h"
#include "drivers/keyboard.h" //todo figure out how to share the interrupt_hooks array properly




void* interrupt_hooks[256] = {0};
    void testHook(uint32_t isr){
        _kprint("\r\nhook works! received ISR:");
        print_hex32(isr);
        _kprint("\r\n");
        _console_render();
        copy_framebuffer();


    }
    //void yieldHook(uint32_t isr){
        //_kprint("\r\nentering yielding interrupt handler");
        //print_hex32(isr);
        //_kprint("\r\n");
        //end_irq(isr-0x80);
        //enable_interrupts();
    //    yield();
        //_kprint("\r\nexiting yielding interrupt handler\r\n");
    //}
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
    set_isr((uint32_t)generic_isr_33,(uint16_t)33);
    set_isr((uint32_t)generic_isr_34,(uint16_t)34);
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

    set_isr((uint32_t)generic_isr_127,(uint16_t)127);
    set_isr((uint32_t)generic_isr_128,(uint16_t)128);
    set_isr((uint32_t)generic_isr_129,(uint16_t)129);
    set_isr((uint32_t)generic_isr_130,(uint16_t)130);
    set_isr((uint32_t)generic_isr_131,(uint16_t)131);
    set_isr((uint32_t)generic_isr_132,(uint16_t)132);
    set_isr((uint32_t)generic_isr_133,(uint16_t)133);
    set_isr((uint32_t)generic_isr_134,(uint16_t)134);
    set_isr((uint32_t)generic_isr_135,(uint16_t)135);
    set_isr((uint32_t)generic_isr_136,(uint16_t)136);
    set_isr((uint32_t)generic_isr_137,(uint16_t)137);
    set_isr((uint32_t)generic_isr_138,(uint16_t)138);
    set_isr((uint32_t)generic_isr_139,(uint16_t)139);
    set_isr((uint32_t)generic_isr_140,(uint16_t)140);
    set_isr((uint32_t)generic_isr_141,(uint16_t)141);
    set_isr((uint32_t)generic_isr_142,(uint16_t)142);
    set_isr((uint32_t)generic_isr_143,(uint16_t)143);
    set_isr((uint32_t)generic_isr_144,(uint16_t)144);


    //enable_interrupts();
    //disable_interrupts();



    //interrupt_hooks[0xd]=&task_end;
    //interrupt_hooks[49]=&testHook;
    //interrupt_hooks[34]=&yieldHook;
    //interrupt_hooks[0x88]=&testHook;
    interrupt_hooks[0x80]=&timer_tick;
    interrupt_hooks[0x81]=&keyboard_int_handler;
    //interrupt_hooks[0x88]=&yieldHook;
    
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
    //uint8_t prev_interrupts = disable_interrupts();

    if(isr<32){
        _blank_screen();
        print_hex32(isr);
        _console_render();
        copy_framebuffer();
        disable_interrupts();
        while(1){};
    }


    if(interrupt_hooks[isr]!=0){
        int (*hookFunc)(uint32_t isr) = interrupt_hooks[isr];
        if(isr>=0x80){
            end_irq(isr-0x80);
        }
        hookFunc(isr);


    } else {

    _kprint("\r\nUnhandled interrupt received: ");
    print_hex32(isr);
    _kprint("\r\n");
    //asm("mov $0,%eax");
    //_blank_screen();
    //_console_render();
    //copy_framebuffer();
    //
    }
        if(isr >= 0x80){
        //_kprint("\r\n received IRQ, sending EOI:");
        //print_hex32(isr-0x80);
        //_kprint("\r\n");
        end_irq(isr-0x80);
    }
    //if(prev_interrupts){
    //enable_interrupts();
    //}
}

void end_irq(uint8_t irq){
    	
        if(irq==0x8){
            outb(0x70, 0x0C);	// select register C of the RTC because we need to clear it
            //print_hex32();		// clear it by reading it
            inb(0x71);
        }
        if(irq==0x1){
            inb(0x60);
        }
        
    
        if(irq>=8){
            outb(PIC1_COMMAND, PIC_EOI);
            outb(PIC2_COMMAND, PIC_EOI);
        } else {
        outb(PIC1_COMMAND, PIC_EOI);
        }
        

    }

void init_irq(){ //shamelessly stolen from https://wiki.osdev.org/8259_PIC#Programming_the_PIC_chips
    disable_interrupts();
    //but oh well there are not that many ways to do this anyways
#define PIC1_OFFSET 0x80
#define PIC2_OFFSET 0x88

#define ICW1_ICW4	0x01		/* Indicates that ICW4 will be present */
#define ICW1_SINGLE	0x02		/* Single (cascade) mode */
#define ICW1_INTERVAL4	0x04		/* Call address interval 4 (8) */
#define ICW1_LEVEL	0x08		/* Level triggered (edge) mode */
#define ICW1_INIT	0x10		/* Initialization - required! */

#define ICW4_8086	0x01		/* 8086/88 (MCS-80/85) mode */
#define ICW4_AUTO	0x02		/* Auto (normal) EOI */
#define ICW4_BUF_SLAVE	0x08		/* Buffered mode/slave */
#define ICW4_BUF_MASTER	0x0C		/* Buffered mode/master */
#define ICW4_SFNM	0x10		/* Special fully nested (not) */

#define CASCADE_IRQ 2

/*
arguments:
	offset1 - vector offset for master PIC
		vectors on the master become offset1..offset1+7
	offset2 - same for slave PIC: offset2..offset2+7
*/

	outb(PIC1_COMMAND, ICW1_INIT | ICW1_ICW4);  // starts the initialization sequence (in cascade mode)
	io_wait();
	outb(PIC2_COMMAND, ICW1_INIT | ICW1_ICW4);
	io_wait();
	outb(PIC1_DATA, PIC1_OFFSET);                 // ICW2: Master PIC vector offset
	io_wait();
	outb(PIC2_DATA, PIC2_OFFSET);                 // ICW2: Slave PIC vector offset
	io_wait();
	outb(PIC1_DATA, 1 << CASCADE_IRQ);        // ICW3: tell Master PIC that there is a slave PIC at IRQ2
	io_wait();
	outb(PIC2_DATA, 2);                       // ICW3: tell Slave PIC its cascade identity (0000 0010)
	io_wait();
	
	outb(PIC1_DATA, ICW4_8086);               // ICW4: have the PICs use 8086 mode (and not 8080 mode)
	io_wait();
	outb(PIC2_DATA, ICW4_8086);
	io_wait();

	// Unmask both PICs.
	outb(PIC1_DATA, 0x00);
	outb(PIC2_DATA, 0x01);
    enable_interrupts();

}

void init_rtc(){
    disable_interrupts();
    outb(0x70,0x8B); //0x80 = disable non-maskable interrupts, 0x0B = select register B of the RTC
    uint8_t previous_regb = inb(0x71);
    outb(0x70, 0x8B); //previous register selection has been reset by the read
    outb(0x71, previous_regb | 0x40); //sets bit 6
    

    //enable_interrupts();
}


void set_PIT(){
    //1.193182 MHz
    disable_interrupts();
    //uint16_t divider = 12000;
    //uint16_t divider = 994; // /994 / 3 = 400 Hz
    uint16_t divider = 200; // /994 / 3 = 400 Hz
    uint8_t divider_low = (divider & 0b11111111 ); 
    uint8_t divider_high = ((divider>>8) &
     0b11111111 ); 
    uint8_t command = 0b00110100;
    outb(0x43,command);
    outb(0x40,divider_low);
    outb(0x40,divider_high);
    enable_interrupts();
}


