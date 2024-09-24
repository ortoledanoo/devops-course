#include "stack.h"

int main(void)
{
	/* Create Stack */	
    	char str[] = "{)}";
    	int stack_size = sizeof(str);
    	int element_size = sizeof(char);

    	stack* char_stack = Create(stack_size, element_size);
        
    	if (char_stack == NULL)
    	{
        	printf("Failed to Create Stack\n");
        	return 1;
    	}
	
	/* For Loop Runs Each char in String */
    	for (int i = 0; str[i] != '\0'; i++)
    	{
		/* Push Open Parentheses */
       		if (str[i] == '{' || str[i] == '[' || str[i] == '(')
        	{
            	Push(char_stack, &str[i]);
        	}
        	else if (str[i] == '}' || str[i] == ']' || str[i] == ')')
        	{
			/* Check If Have Close Before Open */
        		if (IsEmpty(char_stack))
                	{	
                		printf("BAD: Too many closing brackets\n");
                		return 1;
            		}
            

			/* Set Top To Peek Value (converted to 'char') */
            	
			char top = *(char*)Peek(char_stack);
            		if ((top == '{' && str[i] == '}') || 
		            (top == '(' && str[i] == ')') ||
                    	    (top == '[' && str[i] == ']'))
            		{
                		Pop(char_stack);
            		} else {
                		printf("BAD: Parentheses Not Matched\n");
                		return 1;
            		}
        	}
    	}	

        /* Final Return Value, if Empty - GOOD, else - BAD */
    	if (IsEmpty(char_stack))
    	{
        	printf("PERFECT - Parentheses  balanced\n");
    	}
    	else
    	{
        	printf("BAD: Many Open Parentheses \n");
    	}	

    	/* Free THE stack */
    	Destroy(char_stack);
    
    	return 0;
}

