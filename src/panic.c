#include "kernel.h"
#include "asmfunctions.h"
#include "scheduler.h"
#include "interrupt_handlers.h"


uint32_t head_x;
uint32_t head_y;
uint32_t snake_length;
int dir_x;
int dir_y;
uint32_t last_index;
void move_snake();
void snake_task();
void set_consolebuffer(uint32_t x, uint32_t y, uint8_t character, uint8_t attributes);
uint8_t get_consolebuffer(uint32_t x, uint32_t y);
    typedef struct point2d {
        uint32_t x;
        uint32_t y;
        uint16_t character;
    } point2d_t;

    point2d_t snakepoints[256];


void panic(uint32_t err){
    _print_hex_serial(err);
    head_x = 24;
    head_y = 15;
    set_consolebuffer(25,15,'P',3);
    set_consolebuffer(26,15,'A',3);
    set_consolebuffer(27,15,'N',3);
    set_consolebuffer(28,15,'I',3);
    set_consolebuffer(29,15,'C',3);
    
    snake_length = 1;


    dir_x = 0;
    dir_y = 0;
    last_index = 0;
    snakepoints[0].x = head_x;
    snakepoints[0].y = head_x;

    snakepoints[0].character = 'K';





    //create_task((uint32_t)snake_task);
    disable_interrupts();
    snake_task();

};

void snake_task(){
    while(1){
        
        //0x11 = W
        //0x1F = S
        //0x1E = A
        //0x20 = D
        uint8_t scan = inb(0x60);
        if(scan==0x11){
            dir_x=0;
            dir_y=-1;
        }
        if(scan==0x1F){
            dir_x=0;
            dir_y=1;
        }
        if(scan==0x1E){
            dir_x = -1;
            dir_y = 0;
        }
        if(scan==0x20){
            dir_x=1;
            dir_y=0;
        }

        //sleep(100);
        move_snake();
    };
}

void move_snake(){
        head_x+=dir_x;
        head_y+=dir_y;
        set_consolebuffer(snakepoints[last_index].x,snakepoints[last_index].y, 0, 0);
        snakepoints[last_index].x = head_x;
        snakepoints[last_index].y = head_y;
        uint8_t eaten_char = get_consolebuffer(head_x,head_y);
        set_consolebuffer(snakepoints[last_index].x,snakepoints[last_index].y, snakepoints[last_index].character, 3);
        last_index++;
        if(eaten_char) {
            snake_length++;
            snakepoints[snake_length].character = eaten_char;
            snakepoints[snake_length].x = head_x;
            snakepoints[snake_length].y = head_y;
        }
        
        last_index=last_index%snake_length;
        _blank_screen();
        _console_render();
        copy_framebuffer();

        head_x=head_x%kglobals.CONSOLE_COLUMNS;
        head_y=head_y%kglobals.CONSOLE_ROWS;


};

void set_consolebuffer(uint32_t x, uint32_t y, uint8_t character, uint8_t attributes){
    //kglobals.CONSOLE_BUFFER[128]= 'H';
    kglobals.CONSOLE_BUFFER[(y*kglobals.CONSOLE_COLUMNS+x)*2] = character;
    kglobals.CONSOLE_BUFFER[(y*kglobals.CONSOLE_COLUMNS+x)*2+1] = attributes;
}

uint8_t get_consolebuffer(uint32_t x, uint32_t y){
    return kglobals.CONSOLE_BUFFER[(y*kglobals.CONSOLE_COLUMNS+x)*2];
}