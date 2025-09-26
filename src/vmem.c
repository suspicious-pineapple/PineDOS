#include "vmem.h"
#include <stdint.h>
#include <stdatomic.h>
#include "kmalloc.h"
#include "kernel.h"


typedef struct page_table {
    uint32_t pages[1024];
} page_table_t;

typedef struct page_directory {
    page_table_t page_directory[1024];
    

} page_directory_t;




page_directory_t* create_address_space(uint32_t base, uint32_t size){

    page_directory_t* pd = kmalloc(sizeof(page_directory_t));


    return pd;





}












void map_page(page_directory_t* pd, void* physical, void* virtual){
    if((uint32_t)physical%4096 || (uint32_t)virtual%4096){
        panic(MISALIGNED_PAGE);
    }


}








