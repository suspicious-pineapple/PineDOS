#include "vmem.h"
#include <stdint.h>
#include <stdatomic.h>
#include "libc_freestanding/kmalloc.h"
#include "kernel.h"
#include "asmfunctions.h"




uint32_t* create_address_space(uint32_t base, uint32_t size){

    page_directory_t* pd = kmalloc_aligned(sizeof(page_directory_t),4096);

    for(uint32_t i=0; i < 1024;i++){
        pd->page_directory[i] = 0x00000002;
    }

    for(uint32_t j = 0; j < 128; j++){
    for(uint32_t i = 0; i < 1024; i++){
        pd->tables[j].pages[i]=(i*0x1000  +j*0x400000)|0b11;
    }

    pd->page_directory[j] = ((uint32_t) pd->tables[j].pages)|3;

    }
    return pd->page_directory;





}









void test_if_paging_catches_fire(){
    uint32_t* test_pd = create_address_space(0,0);
    _print_hex_serial((uint32_t)test_pd);
    //while(1);
    load_cr3(test_pd);
    enable_paging();

}



