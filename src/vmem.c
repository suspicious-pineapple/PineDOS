#include "vmem.h"
#include <stdint.h>
#include <stdatomic.h>
#include "libc_freestanding/kmalloc.h"
#include "kernel.h"
#include "asmfunctions.h"













uint32_t* identity_map(){
    uint32_t available_memory = kglobals.MULTIBOOT_INFO_ADDR->mem_upper*1024;


    uint32_t* page_directory = kmalloc_aligned(sizeof(uint32_t)*1024,4096);
    for(uint32_t i = 0; i < 1024; i++){
        
        uint32_t* page_table = kmalloc_aligned(sizeof(uint32_t)*1024,4096);
        for(uint32_t j = 0; j < 1024; j++){
            page_table[j] = ((j*0x1000) + (i*0x1000 * 0x400)) | 3;
            if(((j*0x1000) + (i*0x1000 * 0x400)) > available_memory){
                page_table[j] = ((j*0x1000) + (i*0x1000 * 0x400)) | 0;
                
            }
        }
        
        page_directory[i]=(uint32_t)page_table | 3;
    }
    return page_directory;

}













uint32_t test_if_paging_catches_fire(){
    uint32_t* test_pd = identity_map();
    _print_hex_serial(0000);
    _print_hex_serial((uint32_t)test_pd);
    _print_hex_serial(0000);
    //while(1);
    load_cr3((uint32_t)test_pd);
    enable_paging();
    return (uint32_t)test_pd;
}


