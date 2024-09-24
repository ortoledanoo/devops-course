#include "stack.h"

int main(void) {
    int user_case, push_value, stack_size, element_size;
    stack* int_stack;
    printf("Please Enter Stack Size - ");
    scanf("%d", &stack_size);

    printf("\nPlease Enter Element Size - ");
    scanf("%d", &element_size);
    
    int_stack = Create(stack_size, element_size);
    
    if (int_stack == NULL)
    {
        printf("Failed to create stack\n");
        return 1;
    }
    
    do {
        printf("\nStack Operations:\n");
        printf("1) Push\n");
        printf("2) Pop\n");
        printf("3) Peek\n");
        printf("4) Check if Empty\n");
        printf("5) Get Size\n");
        printf("6) Get Capacity\n");
        printf("0) Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &user_case);

        switch(user_case) {
            case 1:
                printf("Enter Value To Push: ");
                scanf("%d", &push_value);
                Push(int_stack, &push_value);
                break;
                
            case 2:
                {
                    /* Convert *void to *int */
                    int* popped = (int*)Pop(int_stack);
		    if (popped == 0)
		    {
			    printf("Enter Another Value by Push");
		    } else {
                    	printf("Popped value: %d\n", *popped);
		    }
                }
                break;
                
            case 3:
                {
                    /* Convert *void to *int */
                    int* peeked = (int*)Peek(int_stack);
	            printf("Top value: %d\n", *peeked);
                }
                break;
                
            case 4:
                printf("Stack is %s\n", IsEmpty(int_stack) ? "Empty" : "Not empty");
                break;
                
            case 5:
                printf("Stack size: %lu\n", Size(int_stack));
                break;
                
            case 6:
                printf("Stack capacity: %lu\n", Capacity(int_stack));
                break;
                
            case 0:
                printf("Exit!\n");
                break;
                
            default:
                printf("Invalid choice\n");
        }
    } while (user_case != 0);
    
    Destroy(int_stack);
    return 0;
}
