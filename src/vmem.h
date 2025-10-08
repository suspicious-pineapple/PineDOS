#pragma once
#include <stdint.h>
extern uint32_t default_cr3;
uint32_t get_default_cr3();
extern uint32_t load_cr3(uint32_t pd);
extern void enable_paging();
uint32_t* create_address_space();

uint32_t test_if_paging_catches_fire();
void map_page(uint32_t physical, uint32_t virtual, uint16_t flags);
uint16_t get_page_flags(uint32_t virtual);
void set_page_flags(uint32_t virtual, uint16_t flags);
void clear_dirty_flag(uint32_t virtual);
