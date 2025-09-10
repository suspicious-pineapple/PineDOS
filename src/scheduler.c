#include "scheduler.h"
#include "kernel.h"
#include "libc_freestanding/kmalloc.h"
#include "libc_freestanding/string.h"
#include <stdint.h>

#include "asmfunctions.h"

Task_t kernel_tasks[256];
uint32_t active_task_index = 0;

uint32_t PID_current = 0;


uint32_t create_task(uint32_t entry){

    PID_current++;

    uint32_t slot=0;
    for(uint32_t i = 1; i < sizeof(kernel_tasks)/sizeof(Task_t);i++){
        if(kernel_tasks[i].state==0){
            slot=i;
            break;
        }
    }
    kernel_tasks[slot].state=1;
    kernel_tasks[slot].regs.eax = 0;
    kernel_tasks[slot].regs.ebx = 0;
    kernel_tasks[slot].regs.edx = 0;
    kernel_tasks[slot].regs.ecx = 0;
    kernel_tasks[slot].regs.esi = 0;
    kernel_tasks[slot].regs.edi = 0;
    kernel_tasks[slot].regs.ebp = 0;
    kernel_tasks[slot].regs.eflags = 0x00200002;
    kernel_tasks[slot].regs.eip = entry;
    kernel_tasks[slot].stack_base = (uint32_t) kmalloc(1024); 
    kernel_tasks[slot].stack_size = 1024;
    kernel_tasks[slot].regs.esp = kernel_tasks[slot].stack_base + 1024; 
    
    kernel_tasks[slot].regs.esp -= 4;
    *(uint32_t*)(kernel_tasks[slot].regs.esp) = (uint32_t)task_end;


    return PID_current;
}
uint32_t init_scheduler(){
        kernel_tasks[0].state=1;
        switch_task(&kernel_tasks[0].regs,&kernel_tasks[0].regs);
return 0;
}

void test_registers(){
    Registers_t currentState;
    Registers_t dummyState;
    switch_task(&currentState,&currentState);
    _kprint("\r\n");
    print_hex32(currentState.eax);
    _kprint("\r\n");
    print_hex32(currentState.ebx);
    _kprint("\r\n");
    print_hex32(currentState.ecx);
    _kprint("\r\n");
    print_hex32(currentState.edx);
    _kprint("\r\n");
    print_hex32(currentState.esi);
    _kprint("\r\n");
    print_hex32(currentState.edi);
    _kprint("\r\n");
    print_hex32(currentState.ebp);
    _kprint("\r\n");
    print_hex32(currentState.esp);
    _kprint("\r\n");
    print_hex32(currentState.eflags);
    _kprint("\r\n");
    print_hex32(currentState.eip);
   _kprint("\r\n");


   yield();
    init_scheduler();
   create_task((uint32_t)example_task_1);
   create_task((uint32_t)refresh_screen_task);

   sched_main_loop();

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

void example_task_1(){
    while(1){
        _kprint("loop\r\n");
        _console_render();
        copy_framebuffer();
        yield();
    }
}


void yield(){
    switch_task(&kernel_tasks[active_task_index].regs, &kernel_tasks[0].regs);

}


void refresh_screen_task(){
    while(1){
    _blank_screen();
    _console_render();
    copy_framebuffer();
    yield();
    }
}


void sched_main_loop(){
    while(1){
    active_task_index++;
    if(kernel_tasks[active_task_index].state!=0){
    _kprint("\r\n switching to next task\r\n");
    switch_task(&kernel_tasks[0].regs,&kernel_tasks[active_task_index].regs);
    }
    if(active_task_index>=255){
        active_task_index=0;
    }
    }



}
















