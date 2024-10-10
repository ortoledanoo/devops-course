#include <stdio.h>
/* Reviewed By Jonahthan */
int IsSumFound(int arr[], int sum, int* index_one, int* index_two, int size);

int main(void)
{
	int arr[] = {-10, -7, -5, -4, -3, -2};
    	int size = sizeof(arr) / sizeof(arr[0]);
    	int index_one, index_two;

    	if (IsSumFound(arr, -9, &index_one, &index_two, size)) 
    	{
        	printf("index one - %d\nindex two - %d\n", index_one, index_two);
    	} 
    	else 
    	{
        	printf("Sum not found\n");
    	}
    	return 0;
}

int IsSumFound(int arr[], int sum, int* index_one, int* index_two, int size)
{
    	*index_one = 0;
    	*index_two = size - 1;

    	while (*index_one < *index_two)  
    	{
        	int current_sum = arr[*index_one] + arr[*index_two];

        	if (current_sum < sum) 
        	{
            		(*index_one)++;  
        	}	 
        	else if (current_sum > sum) 
        	{
            		(*index_two)--;  
        	} 
        	else 
        	{
            		return 1;
        	}
    	}
    return 0;
}
