#pragma once
#include "asmfunctions.h"
extern const uint32_t kernel_end;
void scroll_console();
void copy_framebuffer();
void scroll_framebuffer();
void console_render_partial();
void heartbeat();
void panic(uint32_t err);
uint8_t random_byte();







enum panic_reasons {
    SOMETHING_WENT_WRONG,
    KMALLOC_FAILED,
    INVALID_DRAW,
    MISALIGNED_PAGE
    

};















