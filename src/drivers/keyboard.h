#pragma once
#include <stdint.h>

void init_keyboard();

void keyboard_int_handler();
uint8_t keybuffer_read();
void keybuffer_write(uint8_t key);
int check_keybuffer();
