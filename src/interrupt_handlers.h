#include <stdint.h>
extern void _set_interrupt_routine(uint32_t function,uint16_t interrupt_number);
extern void _setup_interrupts();
void default_interrupt_c();
extern void _enable_interrupts();
extern void _disable_interrupts();
void fill_interrupts();