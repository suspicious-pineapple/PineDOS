#include <stdint.h>
extern void set_interrupt_routine(uint32_t function,uint16_t interrupt_number);
extern void load_interrupts();
extern void enable_interrupts();
extern void disable_interrupts();
void fill_interrupts();
extern void set_isr(uint32_t handler, uint16_t index);
void default_interrupt();
extern void trigger_int();
extern void scheduler_int();
extern void test1();
void handle_interrupt(uint32_t interrupt);
void end_irq(uint8_t irq);
void init_irq();

#define PIC1		0x20		//IO address for master PIC
#define PIC2		0xA0		//IO address for slave PIC
#define PIC1_COMMAND	PIC1
#define PIC1_DATA	(PIC1+1)
#define PIC2_COMMAND	PIC2
#define PIC2_DATA	(PIC2+1)
#define PIC_EOI		0x20
extern void generic_isr_0(void);
extern void generic_isr_1(void);
extern void generic_isr_2(void);
extern void generic_isr_3(void);
extern void generic_isr_4(void);
extern void generic_isr_5(void);
extern void generic_isr_6(void);
extern void generic_isr_7(void);
extern void generic_isr_8(void);
extern void generic_isr_9(void);
extern void generic_isr_10(void);
extern void generic_isr_11(void);
extern void generic_isr_12(void);
extern void generic_isr_13(void);
extern void generic_isr_14(void);
extern void generic_isr_15(void);
extern void generic_isr_16(void);
extern void generic_isr_17(void);
extern void generic_isr_18(void);
extern void generic_isr_19(void);
extern void generic_isr_20(void);
extern void generic_isr_21(void);
extern void generic_isr_22(void);
extern void generic_isr_23(void);
extern void generic_isr_24(void);
extern void generic_isr_25(void);
extern void generic_isr_26(void);
extern void generic_isr_27(void);
extern void generic_isr_28(void);
extern void generic_isr_29(void);
extern void generic_isr_30(void);
extern void generic_isr_31(void);
extern void generic_isr_32(void);
extern void generic_isr_33(void);
extern void generic_isr_34(void);
extern void generic_isr_35(void);
extern void generic_isr_36(void);
extern void generic_isr_37(void);
extern void generic_isr_38(void);
extern void generic_isr_39(void);
extern void generic_isr_40(void);
extern void generic_isr_41(void);
extern void generic_isr_42(void);
extern void generic_isr_43(void);
extern void generic_isr_44(void);
extern void generic_isr_45(void);
extern void generic_isr_46(void);
extern void generic_isr_47(void);
extern void generic_isr_48(void);
extern void generic_isr_49(void);

extern void generic_isr_127(void);
extern void generic_isr_128(void);
extern void generic_isr_129(void);
extern void generic_isr_130(void);
extern void generic_isr_131(void);
extern void generic_isr_132(void);
extern void generic_isr_133(void);
extern void generic_isr_134(void);
extern void generic_isr_135(void);
extern void generic_isr_136(void);
extern void generic_isr_137(void);
extern void generic_isr_138(void);
extern void generic_isr_139(void);
extern void generic_isr_140(void);
extern void generic_isr_141(void);
extern void generic_isr_142(void);
extern void generic_isr_143(void);
extern void generic_isr_144(void);