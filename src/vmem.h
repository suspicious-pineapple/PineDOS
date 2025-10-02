#include <stdint.h>
typedef struct page_table {
    uint32_t pages[1024];
} page_table_t;

typedef struct page_directory {
    page_table_t tables[1024];
    uint32_t page_directory[1024];

} page_directory_t;


extern uint32_t load_cr3(uint32_t* pd);
extern void enable_paging();
uint32_t* create_address_space(uint32_t base, uint32_t size);

void test_if_paging_catches_fire();