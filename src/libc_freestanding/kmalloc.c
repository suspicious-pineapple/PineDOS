#include "../asmfunctions.h"
#include <stdint.h>
#include "kmalloc.h"


typedef struct kmalloc_block {
    uint32_t base;
    uint32_t size;
    uint32_t used;
    struct kmalloc_block *next;
} kmalloc_block_t;
kmalloc_block_t* search_fitting_block(uint32_t size);


static uint32_t current_bump_offset = 0;
const uint32_t heap_size = 0x4000000;
#define kmalloc_heap_base 0x3200000
const uint32_t heap_base = kmalloc_heap_base;

void* kmalloc(uint32_t size){

    
    void* return_ptr = (void *)(heap_base+current_bump_offset);

    current_bump_offset+=size;

    return return_ptr;
    
    //kmalloc_block_t* found_block = search_fitting_block(size);
    //uint32_t base = found_block->base;

    //return (void*)base;
    


}




kmalloc_block_t* search_fitting_block(uint32_t size) {
    kmalloc_block_t* block_list_base = (kmalloc_block_t*)heap_base;
    
    kmalloc_block_t current_block = *block_list_base;
    kmalloc_block_t next_block = *current_block.next;
    while(&next_block && (&next_block.size<size && !next_block.used)){
        current_block = next_block;
        next_block = *current_block.next;
    }
    if(&next_block){
        return &next_block;
    }
    
    uint32_t next_addr = current_block.base+current_block.size;
    uint32_t next_base = next_addr+sizeof(kmalloc_block_t);
    kmalloc_block_t* created_block = (kmalloc_block_t*)next_base;
    created_block->next=0;
    created_block->base=next_base;
    created_block->used=1;
    created_block->size=size;

    return created_block;
}



void test_malloc(){

    for(uint32_t i = 0; i < 250; i++){

    }

}



























