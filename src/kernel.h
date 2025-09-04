#pragma once
#include "asmfunctions.h"
extern const uint32_t kernel_end;
void scroll_console();
void copy_framebuffer();
void scroll_framebuffer();
void console_render_partial();