#include "grains.h"

uint64_t square(uint8_t index) {
    if (index > 64 || index == 0) {
        return 0;
    }

    return 1 << (index - 1);
}

