#pragma once
#include <stdint.h>
extern void _kprint(char *); // 
extern void _console_render(void); //update the kernel console
extern void _outb(uint16_t, uint8_t);
extern void _set_console_color(uint8_t);
extern void _fault();
extern void _default_interrupt_handler();
extern void _blank_screen();

extern uint32_t* CONSOLE_BUFFER;
extern uint32_t* CONSOLE_ROWS;
