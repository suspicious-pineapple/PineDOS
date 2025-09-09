#include "scheduler.h"
#include "libc_freestanding/kmalloc.h"
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



Task_t kernel_tasks[256];
uint32_t active_task_index = 0;

uint32_t PID_current = 0;


uint32_t create_task(){

    PID_current++;

    uint32_t slot=0;
    for(uint32_t i = 1; i < sizeof(kernel_tasks)/sizeof(Task_t);i++){
        if(kernel_tasks[i].state==0){
            slot=i;
            break;
        }
    }
    kernel_tasks[slot].regs.eax = 0;
    kernel_tasks[slot].regs.ebx = 0;
    kernel_tasks[slot].regs.edx = 0;
    kernel_tasks[slot].regs.ecx = 0;
    kernel_tasks[slot].regs.esi = 0;
    kernel_tasks[slot].regs.edi = 0;
    kernel_tasks[slot].regs.ebp = 0;
    kernel_tasks[slot].regs.eflags = 0;
    kernel_tasks[slot].regs.esp = 0;
    kernel_tasks[slot].regs.eip = 0;
    kernel_tasks[slot].stack_base = (uint32_t) kmalloc(1024); 
    kernel_tasks[slot].stack_size = 1024;
    kernel_tasks[slot].stack_ptr = kernel_tasks[slot].stack_base + 1024; 
    
    kernel_tasks[slot].stack_ptr -= 4;
    *(uint32_t*)(kernel_tasks[slot].stack_base+kernel_tasks[slot].stack_ptr) = task_end;

    return PID_current;
}
uint32_t init_scheduler(){

}


void task_end(){
    kernel_tasks[active_task_index].state = 0;
    _kprint("\r\n Task finished with ID: ");
    print_hex32(kernel_tasks[active_task_index].id);
    _kprint(" in slot: ");
    print_hex32(active_task_index);
    _kprint("\r\n");
    yield();
}



void yield(){
    

}


void main_loop(){





}
















