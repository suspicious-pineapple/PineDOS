#include <stdint.h>


typedef struct Registers {
    uint32_t cr3;
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
    uint64_t sleep_until;
    struct Task *next;
} task_t;

void task_end(uint32_t exit_code);
void yield();
void sched_main_loop();
void test_registers();
uint32_t init_scheduler();
uint32_t create_task(uint32_t entry);
extern void switch_task(Registers_t *old, Registers_t *new);
void example_task_1();
void example_task_2();
void refresh_screen_task();
void irq_enable_task();
void timer_tick(uint16_t isr);
void sleep(uint32_t time);
void wait_for_key();