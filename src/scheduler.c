#include "scheduler.h"
#include "kernel.h"
#include "interrupt_handlers.h"
#include "libc_freestanding/kmalloc.h"
#include "libc_freestanding/string.h"
#include "libc_freestanding/mutex.h"
#include <stdint.h>
#include "drivers/keyboard.h"
#include "asmfunctions.h"
#include "vmem.h"
task_t kernel_tasks[256];

uint32_t active_task_index = 0;
uint32_t PID_current = 0;

uint32_t base_cr3;
uint32_t create_task(uint32_t entry){

    PID_current++;

    uint32_t slot=0;
    for(uint32_t i = 1; i < sizeof(kernel_tasks)/sizeof(task_t);i++){
        if(kernel_tasks[i].state==0){
            slot=i;
            break;
        }
    }
    kernel_tasks[slot].id=PID_current;
    kernel_tasks[slot].sleep_until = 0;;


    kernel_tasks[slot].state=1;
    kernel_tasks[slot].regs.cr3 = base_cr3;
    kernel_tasks[slot].regs.eax = 0;
    kernel_tasks[slot].regs.ebx = 0;
    kernel_tasks[slot].regs.edx = 0;
    kernel_tasks[slot].regs.ecx = 0;
    kernel_tasks[slot].regs.esi = 0;
    kernel_tasks[slot].regs.edi = 0;
    kernel_tasks[slot].regs.ebp = 0;
    kernel_tasks[slot].regs.eflags = 0x00200202; //no idea where this value comes from, i took it from qemu. its probably good
    kernel_tasks[slot].regs.eip = entry;
    kernel_tasks[slot].stack_base = (uint32_t) kmalloc(1024); 
    kernel_tasks[slot].stack_size = 1024;
    kernel_tasks[slot].regs.esp = kernel_tasks[slot].stack_base + 1024; 
    
    *(uint32_t*)(kernel_tasks[slot].regs.esp) = (uint32_t)task_end;
    kernel_tasks[slot].regs.esp -= 4;


    return slot;
}
uint32_t init_scheduler(){
        base_cr3 =default_cr3;
        kernel_tasks[0].state=1;
        switch_task(&kernel_tasks[0].regs,&kernel_tasks[0].regs);

        create_task((uint32_t)irq_enable_task);
        create_task((uint32_t)idle_task);
        //create_task((uint32_t)interrupt_task);
        return 0;
}

void test_registers(){
    Registers_t currentState;
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


   
}

void task_end(uint32_t exit_code){
    kernel_tasks[active_task_index].state = 0;
    _kprint("\r\n Task finished with ID: ");
    print_hex32(kernel_tasks[active_task_index].id);
    _kprint(" in slot: ");
    print_hex32(active_task_index);
    _kprint(" with code: ");
    print_hex32(exit_code);
    _kprint("\r\n");
    yield();


}

void example_task_1(){

    while(1){
        //_kprint("\r\nloop A\r\n");
    }

}
void example_task_2(){

    while(1){
        //_kprint("\r\nloop B\r\n");
    }

}
  void irq_enable_task(){
    init_irq();
    init_rtc();
    set_PIT();
    enable_interrupts();
    task_end(0);    
    };




void yield(){
    switch_task(&kernel_tasks[active_task_index].regs, &kernel_tasks[0].regs);

}
void wait_for_key(){
    kernel_tasks[active_task_index].state=TASK_KEYWAIT;
    yield();
    kernel_tasks[active_task_index].state=TASK_RUNNING;
    
}

void enter_critical(){
    kernel_tasks[active_task_index].state=TASK_CRITICAL;
}
void exit_critical(){
    kernel_tasks[active_task_index].state=TASK_RUNNING;
}


uint32_t refresh_timer = 0;
void refresh_screen_task(){
    while(1){
        asm("mov $0x210548, %eax");
        
        _blank_screen();
        _console_render();
        copy_framebuffer();

        yield();
        
        
    }
}


void idle_task(){
    while(1){
        //wait_for_interrupts();
        yield();
    }
}



void sleep(uint32_t time){
    kernel_tasks[active_task_index].sleep_until = kglobals.KERNEL_TIME+time;
    yield();
}

  
void sched_main_loop(){
    while(1){
    disable_interrupts();
    if(active_task_index>=255){
        active_task_index=0;
        
    }
    active_task_index++;    //task 0 is never valid, thats the scheduler itself
   


    task_t current_task = kernel_tasks[active_task_index];
    
    int should_run = (current_task.state==2&&check_keybuffer()) || current_task.state == TASK_RUNNING;
    should_run = should_run && (kglobals.KERNEL_TIME > current_task.sleep_until);

    if(should_run){
        
        /*
    if((current_task.regs.esp - current_task.stack_base)<32){
        _kprint("\r\nThe stack fell over! task killed");
        _console_render();
        copy_framebuffer();
        current_task.state=0;


    }
    */
    //print_hex32(_get_stacksize());
    //_kprint("\r\n");
    //_kprint("\r\ntask : ");
    //print_hex32(active_task_index);
    //_kprint("\r\nremaining stack: ");
    //uint32_t remaining_stack = kernel_tasks[active_task_index].regs.esp - kernel_tasks[active_task_index].stack_base;
    //print_hex32(remaining_stack);
    // _kprint(" \r\nswitching to next task\r\n");
    
     switch_task(&kernel_tasks[0].regs,&current_task.regs);
    }
        
    }



}

void timer_tick(uint16_t isr){
    kglobals.KERNEL_TIME++;
    end_irq(isr-0x80);
    if(kglobals.KERNEL_TIME%2 == 0){

        if(kernel_tasks[active_task_index].state!=TASK_CRITICAL){
        yield();
        }
    //switch_task_int(&kernel_tasks[active_task_index].regs, &kernel_tasks[0].regs);

    }

}















