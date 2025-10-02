#include "vmem.h"
#include <stdint.h>
#include <stdatomic.h>
#include "libc_freestanding/kmalloc.h"
#include "kernel.h"
#include "asmfunctions.h"







//uint32_t[1024] 









//void test_if_paging_catches_fire(){
//    uint32_t* test_pd = create_address_space(0,0);
//    _print_hex_serial((uint32_t)test_pd);
//    //while(1);
//    load_cr3(test_pd);
//    enable_paging();
//
//}
//


