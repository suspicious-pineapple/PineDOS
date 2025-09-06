#include <stdint.h>
extern void set_interrupt_routine(uint32_t function,uint16_t interrupt_number);
extern void load_interrupts();
extern void enable_interrupts();
extern void disable_interrupts();
void fill_interrupts();
extern void set_isr(uint32_t handler, uint16_t index);
void default_interrupt();
extern void trigger_int();