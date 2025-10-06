#include <stdint.h>
#include "../scheduler.h"
typedef uint8_t mutex;
extern uint8_t try_lock_mutex(mutex* lock);
extern void lock_spinlock(mutex* lock);
extern void release_mutex(mutex* lock);
void lock_mutex(mutex* lock);