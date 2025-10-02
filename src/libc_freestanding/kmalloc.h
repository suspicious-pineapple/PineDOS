#include <stdint.h>
void* kmalloc(uint32_t size);
void* kmalloc_aligned(uint32_t size, uint32_t align);
void kfree(void *ptr);


void kmalloc_torture_test();