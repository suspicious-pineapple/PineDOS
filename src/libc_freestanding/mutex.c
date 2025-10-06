#include "mutex.h"



void lock_mutex(mutex* lock){
        while(try_lock_mutex(lock)){sleep(0);};
}














