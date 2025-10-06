#include "../asmfunctions.h"
#include <stdint.h>
#include "kmalloc.h"
#include "../kernel.h"
#include "../scheduler.h"

typedef struct kmalloc_block {
    uint32_t base;
    uint32_t returned_base;
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


}


void init_list(){
    list_root.base = heap_base+sizeof(kmalloc_block_t);
    list_root.returned_base = heap_base+sizeof(kmalloc_block_t);
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
        
        if(current->size == size && current->used==0){

            return (void*)current->base;
        }
        if(current->size > size+sizeof(kmalloc_block_t) && current->used==0){
            break;
        }
        
        
    }

    if(current->base+current->size+size+sizeof(kmalloc_block_t) > heap_base+heap_size){
        panic(1);
    }

    if(current->next != 0){
        current->size -= sizeof(kmalloc_block_t)+size;
    }
    kmalloc_block_t* next = (kmalloc_block_t*)(current->base+current->size);

    next->used=1;
    next->size=size;
    next->base=(current->base+current->size+sizeof(kmalloc_block_t));
    next->returned_base=next->base;
    next->next = current->next; //if this is the end of the list, this should be 0, due to the initial while loop. if its not the end of the list and breaking up an existing block instead, this holds the next block

    current->next=next;
    _print_hex_serial((uint32_t)next);    
    _print_hex_serial((uint32_t)next->base);    

    
    return (void*)next->returned_base;
    


}


/*

void* kmalloc_aligned(uint32_t size, uint32_t alignment){
    if(!inited){
        init_list();
        inited=1;
    }
    size+=alignment;
    kmalloc_block_t* current = &list_root;

    
    while(current->next){
        current = current->next;
        
        if(current->size >= size && current->used==0 && current->base%alignment==0){
            current->returned_base=current->base;
            return (void*)current->base;
        }
        
        
    }

    if(current->base+current->size+size+sizeof(kmalloc_block_t) > heap_base+heap_size){
        panic(1);
    }

    kmalloc_block_t* next = (kmalloc_block_t*)(current->base+current->size);
    next->used=1;
    next->size=size;
    next->base=(current->base+current->size+sizeof(kmalloc_block_t));
    uint32_t returned_base = (next->base + alignment) - next->base%alignment;
    
    next->returned_base=returned_base;
    next->next = 0;

    current->next=next;
    _print_hex_serial((uint32_t)next);    
    _print_hex_serial((uint32_t)next->base);    
    _print_hex_serial((uint32_t)next->returned_base);    

    //while(1){};
    return (void*)next->returned_base;
    


}
*/

void* kmalloc_aligned(uint32_t size, uint32_t alignment){
    uint32_t padded_size = size+alignment;
    uint32_t base = (uint32_t)kmalloc(padded_size);
    kmalloc_block_t* returned_block = (kmalloc_block_t*)(base-sizeof(kmalloc_block_t));
    returned_block->returned_base = (base + alignment) - (base%alignment);
    return (void*)returned_block->returned_base;
}


void kernel_heap_cleanup(){
    kmalloc_block_t* current = &list_root;
    
    while(current->next && current->next->next){

        
        if(current->used==0 && current->next->used==0){
            current->next=current->next->next;
            current->size = (uint32_t)current->next - current->base;
        }
        current = current -> next;


    }

}








void kfree(void* ptr){
    
    kmalloc_block_t* current = &list_root;

    
    while(current->next){
        current = current->next;
        
        if(current->returned_base == (uint32_t)ptr){
            current -> used = 0;
            return;
        }
    }


}





void kmalloc_torture_test(){

    for(uint32_t i = 0; i < 99999; i++){
        
        void* pointer1 = kmalloc(random_byte());
        for(uint16_t j = 0; j < random_byte(); j++){
        random_byte();
        }
        
        void* pointer2 = kmalloc(random_byte()*4);
        void* pointer3 = kmalloc_aligned(random_byte(), random_byte());
        void* pointer4 = kmalloc(random_byte());
        kfree(pointer2);
        void* pointer5 = kmalloc(random_byte()*4);
        kfree(pointer1);
        kfree(pointer5);
        kfree(pointer3);
        kfree(pointer4);

        //kernel_heap_cleanup();


    }

    _kprint("passed kmalloc torture test, somehow");

}













