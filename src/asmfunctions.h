#pragma once
#include <stdint.h>
extern void _kprint(char *); // 
extern void _console_render(void); //update the kernel console
extern void outb(uint16_t, uint8_t);
extern void outw(uint16_t, uint16_t);
extern void outd(uint16_t, uint32_t);
extern uint8_t inb(uint16_t);
extern uint16_t inw(uint16_t);
extern uint32_t ind(uint16_t);
extern void _set_console_color(uint8_t);
extern void _fault();
extern void _default_interrupt_handler();
extern void _blank_screen();
extern uint32_t _get_stacksize();
extern void _console_render_line(uint32_t line);
/*
extern uint8_t CONSOLE_BUFFER[42*69*2];
extern uint32_t CONSOLE_ROWS;
extern uint32_t FRAMEBUFFER;
extern uint32_t FRAMEBUFFER_PITCH;
extern uint32_t FRAMEBUFFER_WIDTH;
extern uint32_t FRAMEBUFFER_HEIGHT;
extern uint32_t FRAMEBUFFER_BPP;
extern uint32_t FRAMEBUFFER_TYPE;
extern uint32_t KERNEL_HEAP;

*/





typedef struct kvals {
    uint32_t MULTIBOOT_INFO_ADDR;
    uint32_t FRAMEBUFFER;
    uint32_t FRAMEBUFFER_PITCH;
    uint32_t FRAMEBUFFER_WIDTH;
    uint32_t FRAMEBUFFER_HEIGHT;
    uint32_t FRAMEBUFFER_BPP;
    uint32_t FRAMEBUFFER_TYPE;
    
    uint32_t KERNEL_TIME;
    uint32_t CONSOLE_COLUMNS;
    uint32_t CONSOLE_ROWS;
    uint32_t CONSOLE_CURRENT_ROW;
    uint32_t CONSOLE_CURRENT_COLUMN;
    uint32_t CONSOLE_COLOR;
    uint32_t DISPLAY_SCALE;
    uint32_t CHARACTER_HEIGHT;
    uint32_t CHARACTER_WIDTH;
    uint8_t CONSOLE_BUFFER[38*72*2];

} kvals;


extern kvals kglobals;



