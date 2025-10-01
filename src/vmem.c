#include "vmem.h"
#include <stdint.h>
#include <stdatomic.h>
#include "libc_freestanding/kmalloc.h"
#include "kernel.h"
#include "asmfunctions.h"




page_directory_t* create_address_space(uint32_t base, uint32_t size){

    page_directory_t* pd = kmalloc(sizeof(page_directory_t));

    for(uint32_t i=0; i < 1024;i++){
        pd->page_directory[i] = 0x00000002;
    }

    for(uint32_t i = 0; i < 1024; i++){
        pd->tables[0].pages[i]=(i*0x1000)|0b11;
    }

    pd->page_directory[0] = ((uint32_t) pd->tables[0].pages)|3;

    return pd;





}









void test_if_paging_catches_fire(){
    page_directory_t* test_pd = create_address_space(0,0);
    load_cr3(test_pd);
}



