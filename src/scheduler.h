#include <stdint.h>


typedef struct Registers {
    uint32_t eflags;
    uint32_t edi;
    uint32_t esi;
    uint32_t ebp;
    uint32_t esp;
    uint32_t ebx;
    uint32_t edx;
    uint32_t ecx;
    uint32_t eax;
    uint32_t eip;


} Registers_t;


typedef struct Task {
    uint32_t stack_base;
    uint32_t stack_size;
    Registers_t regs;
    uint32_t id;
    uint8_t state;
} Task_t;

void task_end();
void yield();
void main_loop();
void test_registers();
uint32_t init_scheduler();
uint32_t create_task(uint32_t entry);
extern void switch_task(Registers_t *old, Registers_t *new);
