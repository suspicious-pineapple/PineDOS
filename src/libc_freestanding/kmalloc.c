#include "../asmfunctions.h"
#include <stdint.h>
#include "kmalloc.h"


typedef struct kmalloc_block {
    uint32_t base;
    uint32_t size;
    uint32_t used;
    struct kmalloc_block *next;
} kmalloc_block_t;


static uint32_t current_bump_offset = 0;
const uint32_t heap_size = 0x4000000;
#define kmalloc_heap_base 0x3200000
const uint32_t heap_base = kmalloc_heap_base;

void* kmalloc(uint32_t size){

    
     void* return_ptr = (void *)(heap_base+current_bump_offset);

     current_bump_offset+=size;

    return return_ptr;
    
    


}




kmalloc_block_t search_fitting_block(uint32_t size) {
    kmalloc_block_t* block_list_base = (void*)heap_base;
    
    kmalloc_block_t current_block = *block_list_base;
    kmalloc_block_t next_block = *current_block.next;
    while(&next_block && &next_block.size<=size){
        current_block = next_block;
        next_block = *current_block.next;
    }


}































