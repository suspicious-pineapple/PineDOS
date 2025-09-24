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

kmalloc_block_t list_root;


void* bump_malloc(uint32_t size){

    
    void* return_ptr = (void *)(heap_base+current_bump_offset);

    current_bump_offset+=size;

    return return_ptr;
    
    //kmalloc_block_t* found_block = search_fitting_block(size);
    //uint32_t base = found_block->base;

    //return (void*)base;
    


}


void init_list(){
    //list_root = bump_malloc(sizeof(kmalloc_block_t)+16); //if anyone ever finds this, im doing this because i have no idea how to C. sorry Mr. Ritchie
    list_root.base = heap_base+sizeof(kmalloc_block_t);
    list_root.size = 16; //unused bytes idk
    list_root.used = 1; //dont use this one
    list_root.next = 0;

}
int inited = 0;
void* kmalloc(uint32_t size){
    if(!inited){
        init_list();
        inited=1;
    }
    
    kmalloc_block_t* current = &list_root;

    
    while(current->next){
        current = current->next;
        
        
        
    }


    kmalloc_block_t* next = (kmalloc_block_t*)(current->base+current->size);
    next->used=1;
    next->size=size;
    next->base=(current->base+current->size+sizeof(kmalloc_block_t));
    next->next = 0;

    current->next=next;
    _print_hex_serial((uint32_t)next);    
    _print_hex_serial((uint32_t)next->base);    

    //while(1);
    
    return (void*)next->base;
    //return bump_malloc(size);



}






















