#include <stdio.h>
/* Reviewed By Jonahthan */
void Sort(int* arr, int size);

int main(void)
{
	int array[] = {0,1,1,1,1,1,1,1,0,1,1,0,0,0,0,0,1};
	int size = sizeof(array)/4;
	Sort(array, size);

	for (int i = 0; i < size; i++)
	{
		printf("%d ", array[i]);
	}
	printf("\n");
	return 0;

}

void Sort(int* arr, int size)
{
	int i = 0;
	int flag = 0; /* Last Time Swapped index */
	int temp = 0;
	
	for (i = 0; i < size; i++)
	{
		if (arr[i] == 0)
		{
		        /* Swap */
			temp = arr[flag];
			arr[flag] = arr[i];
			arr[i] = temp;
			flag++;
		}
	}
}
