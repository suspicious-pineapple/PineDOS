#include "vmem.h"
#include <stdint.h>
#include "libc_freestanding/kmalloc.h"
#include "kernel.h"
#include "asmfunctions.h"









uint32_t default_cr3 = 0;

uint32_t* page_directory;



uint32_t* identity_map(){
    uint32_t available_memory = kglobals.MULTIBOOT_INFO_ADDR->mem_upper*1024;


    page_directory = kmalloc_aligned(sizeof(uint32_t)*1024,4096);
    for(uint32_t i = 0; i < 1024; i++){
        
        uint32_t* page_table = kmalloc_aligned(sizeof(uint32_t)*1024,4096);
        for(uint32_t j = 0; j < 1024; j++){
            page_table[j] = ((j*0x1000) + (i*0x1000 * 0x400)) | 3;
            if(((j*0x1000) + (i*0x1000 * 0x400)) > available_memory){
                //page_table[j] = ((j*0x1000) + (i*0x1000 * 0x400)) | 0;
                
            }
        }
        
        page_directory[i]=(uint32_t)page_table | 3;
    }
    return page_directory;

}

void map_page(uint32_t physical, uint32_t virtual, uint16_t flags){
    if(physical%4096!=0 || virtual%4096!=0){
        panic(MISALIGNED_PAGE);
    }
    uint32_t page_directory_index = virtual >> 22; //12 bits -> 4096, 10 bits -> 1024
    uint32_t page_table_index = (virtual >> 12) & 0b1111111111;

    uint32_t* page_table = (uint32_t*)((page_directory[page_directory_index]) & 0xFFFFFC00);
    
    page_table[page_table_index] = physical | (flags&0xFFF);
    
}

uint16_t get_page_flags(uint32_t virtual){
    if(virtual%4096!=0){
        panic(MISALIGNED_PAGE);
    }
    uint32_t page_directory_index = virtual >> 22; //12 bits -> 4096, 10 bits -> 1024
    uint32_t page_table_index = (virtual >> 12) & 0b1111111111;

    uint32_t* page_table = (uint32_t*)((page_directory[page_directory_index]) & 0xFFFFFC00);
    
    return (uint16_t)page_table[page_table_index] & 0x3FF; //last 10 bits

    
}
void set_page_flags(uint32_t virtual, uint16_t flags){
    if(virtual%4096!=0){
        panic(MISALIGNED_PAGE);
    }
    uint32_t page_directory_index = virtual >> 22; //12 bits -> 4096, 10 bits -> 1024
    uint32_t page_table_index = (virtual >> 12) & 0b1111111111;

    uint32_t* page_table = (uint32_t*)((page_directory[page_directory_index]) & 0xFFFFFC00);
    
    page_table[page_table_index] = (page_table[page_table_index] & 0xFFFFFC00) | flags & 0x3FF; //last 10 bits

}

void clear_dirty_flag(uint32_t virtual){
    if(virtual%4096!=0){
        panic(MISALIGNED_PAGE);
    }
    uint32_t page_directory_index = virtual >> 22; //12 bits -> 4096, 10 bits -> 1024
    uint32_t page_table_index = (virtual >> 12) & 0b1111111111;

    uint32_t* page_table = (uint32_t*)((page_directory[page_directory_index]) & 0xFFFFFC00);
    
    page_table[page_table_index] = page_table[page_table_index] & 0xFFFFFFBF;

    
}




uint32_t get_default_cr3(){
    return (uint32_t)page_directory;
}



uint32_t test_if_paging_catches_fire(){
    uint32_t* test_pd = identity_map();
    _print_hex_serial(0000);
    _print_hex_serial((uint32_t)test_pd);
    _print_hex_serial(0000);
    load_cr3((uint32_t)test_pd);
    enable_paging();
    default_cr3 = (uint32_t)test_pd;
    return (uint32_t)test_pd;
}


