#pragma once
#include <stdint.h>

extern void* memcpy(void* dest, void* source, uint32_t size);
extern void* memmove(void* dest, void* source, uint32_t size);
extern void* memset(void* dest, uint8_t value, uint32_t size); // all these are found in src/asmutil/memfunc.asm

int memcmp(const void *s1, const void *s2, uint32_t n);