#include <stdint.h>
#include "string/strfunc.c"

extern void* memcpy(void* dest, void* source, uint32_t size);
extern void* memmove(void* dest, void* source, uint32_t size);
extern void* memset(void* dest, uint8_t value, uint32_t size); // all these are found in src/asmutil/memfunc.asm

