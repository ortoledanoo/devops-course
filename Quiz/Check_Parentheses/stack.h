#ifndef __STACK_HEADER_H__
#define __STACK_HEADER_H__

#include <stddef.h> /* size_t */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct
{
    void *head_ptr;
    size_t capacity;
    size_t size;
    size_t size_of_element;
}stack;

/* Create a stack */
stack* Create(const size_t capacity, const size_t size_element);

/* Destroy a stack (free allocated memory and set ptr to NULL). return True(0) or false(1) */
int Destroy(stack* stk); 

/* Push a value(input) to the stack */
void Push(stack* stk, const void const* input); 

/* Pop (remove) a value of the last element from the stack */
void* Pop(stack* stk); 

/* Return true(0) if the stack is empty and false(1) if the stack is not empty */
int IsEmpty(const stack* stk); 

/* Return true if the stack is empty and false if the stack is not empty */
void* const Peek(const stack* stk);  

/* Return the current size of the stack (How many elements in the stack) */
size_t Size(const stack* stk); 

/* Return the capacity of the stack */
size_t Capacity(const stack* stk); 



#endif

