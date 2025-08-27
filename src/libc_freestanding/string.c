#include <stdint.h>
#include <stddef.h>
#include "./string.h"
#include "../asmfunctions.h"


int memcmp(const void *s1, const void *s2, uint32_t n){

    const unsigned char *a = s1;
    const unsigned char *b = s2;


    for(uint32_t i = 0; i < n; i++) {
        if(((*(a+i)) - *(b+i))!=0){
            return (int8_t) ((*(a+i)) - *(b+i));

        }
    }
    

    return 0;
}







char* hex32_to_ascii(char* dest,uint32_t value){
    dest[0]='0';
    dest[1]='x';
    dest[11]=0;

    char nibbles[17] = "0123456789ABCDEF";

    for(int i = 0; i < 8; i++){
        int tmp = (value >> (4*i)) & 0xF;
        dest[9-i]=nibbles[tmp];
    }


    return dest;
}

void print_hex32(uint32_t value){
    char dest[11];
    
}
