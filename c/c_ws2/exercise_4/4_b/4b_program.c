#include <stdio.h>

void SwapPointers(size_t **a, size_t **b);

int main(void) {
    size_t x = 10, y = 20;
    size_t *ptr1 = &x;
    size_t *ptr2 = &y;

    printf("ptr1 points to %lu, ptr2 points to %lu\n", *ptr1, *ptr2);

    SwapPointers(&ptr1, &ptr2);
    printf("************SWAP************\n");

    printf("ptr1 points to %lu, ptr2 points to %lu\n", *ptr1, *ptr2);

    return 0;
}

void SwapPointers(size_t **a, size_t **b) {
    size_t *temp = *a;
    *a = *b;
    *b = temp;
}

