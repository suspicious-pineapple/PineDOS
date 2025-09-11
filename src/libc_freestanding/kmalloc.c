#include "../asmfunctions.h"
#include <stdint.h>




static uint32_t current_bump_offset = 0;
const uint32_t heap_size = 0x4000000;
const uint32_t heap_base = 0x3200000;

void* kmalloc(uint32_t size){
    uint32_t aligned_size = size+16;

    aligned_size -= aligned_size % 16;

    
     void* return_ptr = (void *)(heap_base+current_bump_offset);

     current_bump_offset+=aligned_size;

    return return_ptr;
    
    


}




































