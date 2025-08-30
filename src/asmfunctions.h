#pragma once
#include <stdint.h>
extern void _kprint(char *); // 
extern void _console_render(void); //update the kernel console
extern void _outb(uint16_t, uint8_t);
extern void _set_console_color(uint8_t);
extern void _fault();
extern void _default_interrupt_handler();
extern void _blank_screen();
extern uint32_t _get_stacksize();

extern uint8_t CONSOLE_BUFFER[42*69*2];
extern uint32_t CONSOLE_ROWS;
extern uint32_t FRAMEBUFFER;
extern uint32_t FRAMEBUFFER_PITCH;
extern uint32_t FRAMEBUFFER_WIDTH;
extern uint32_t FRAMEBUFFER_HEIGHT;
extern uint32_t FRAMEBUFFER_BPP;
extern uint32_t FRAMEBUFFER_TYPE;
extern uint32_t KERNEL_HEAP;