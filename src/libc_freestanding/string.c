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