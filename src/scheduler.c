#include "scheduler.h"
#include <stdint.h>


typedef struct Registers {
    uint32_t eax;
    uint32_t ebx;
    uint32_t ecx;
    uint32_t edx;
    uint32_t esi;
    uint32_t edi;
    uint32_t ebp;
    uint32_t eflags;
    uint32_t esp;
    uint32_t eip;


} Registers_t;


typedef struct Task {
    uint32_t stack_base;
    uint32_t stack_ptr;
    uint32_t stack_size;
    Registers_t regs;
    uint32_t id;
    uint8_t state;
} Task_t;



Task_t kernel_tasks[1024];
uint32_t active_task_index = 0;

uint32_t PID_current = 0;


uint32_t create_task(){

    PID_current++;




    return 
}


void scheduler_tick(){
    
}


void main_loop(){





}
















