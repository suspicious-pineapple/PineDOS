#include <stdint.h>


extern uint32_t load_cr3(uint32_t* pd);
extern void enable_paging();
uint32_t* create_address_space();

void test_if_paging_catches_fire();