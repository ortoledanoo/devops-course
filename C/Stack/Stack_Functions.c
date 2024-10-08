#include "stack.h"

stack* Create(const size_t capacity, const size_t size_element)
{
    /* Allocate Pointer To StackStruct */
    stack* stk_ptr = (stack*)malloc(sizeof(stack));
    if (stk_ptr == NULL) {
        return NULL;
    }
    
    /* Allocate Capacity * Size Of each Element */
    (*stk_ptr).head_ptr = malloc(capacity * size_element);
    if ((*stk_ptr).head_ptr == NULL) {
        free(stk_ptr);
        return NULL;
    }
    
    /* Reset Struct Values */
    (*stk_ptr).capacity = capacity;
    (*stk_ptr).size = 0;
    (*stk_ptr).size_of_element = size_element;
    printf("Stack created\n");
    
    /* Return The Pointer To Struct */
    return stk_ptr;
}

int Destroy(stack* stk_ptr)
{
    /* Free The HEAD Pointer */
    free ((*stk_ptr).head_ptr);
    (*stk_ptr).head_ptr = NULL;
    printf("Head Pointer Free\n\n");
    
    /* Free Stack Pointer */
    free (stk_ptr);
    stk_ptr = NULL;
    printf("Stack Free\n\n");
    return 0;
}

void Push(stack* stk_ptr, const void *input)
{
    char* bullet;
    /* Check if Stack is Full */
    if ((*stk_ptr).size >= (*stk_ptr).capacity)
    {
        printf("Stack is Full\n\n");
    } else {
    
    	bullet = (char*)(*stk_ptr).head_ptr + ((*stk_ptr).size * (*stk_ptr).size_of_element);
    
    
    	/* memcpy (destenation, source, size) */
    	memcpy(bullet, input, (*stk_ptr).size_of_element);
    
    	/* Push The Stack 1 Forward */
    	(*stk_ptr).size++;
    }
}

void* Pop(stack* stk_ptr)
{
    /* Memory To Return */
    void* popped;
    
    /* Check Stack is Not Empty */
    if (IsEmpty(stk_ptr)) {
        printf("Stack is Empty!!\n");
        return 0;
    } else {
    
    	/*Reduce Stack in 1 */
    	(*stk_ptr).size--;
    
    	/* Allocate Returned Element */
    	popped = (char*)(*stk_ptr).head_ptr + ((*stk_ptr).size *(*stk_ptr).size_of_element);;
    
    	/* Return Pointer To Last Element */
    	return popped;
    }
}

int IsEmpty(const stack* stk_ptr)
{
    /* Returns if Size is 0 */
    return (*stk_ptr).size == 0;
}

void* Peek(const stack* stk_ptr)
{
    /* Check if is Empty */
    if ((*stk_ptr).size == 0) {
        printf("Stack is Empty!\n");
        return NULL;
    }
    
    /* Returns void pointer of HEAD + ((SIZE - 1)* Size of Element) */
    return (char*)(*stk_ptr).head_ptr + ((*stk_ptr).size - 1) * (*stk_ptr).size_of_element;
}

size_t Size(const stack* stk_ptr)
{
    /* Returns Current Size */
    return (*stk_ptr).size;
}

size_t Capacity(const stack* stk_ptr)
{
    /* Returns Capacity */
    return (*stk_ptr).capacity;
}


