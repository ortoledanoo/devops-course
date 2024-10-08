#include <stdio.h> /* printf */
/* Reviewed By Joni*/
int Bursa(int arr[], int size, int* buy, int* sell);

int main(void)
{
	printf("Bursa Quiz\n");
	int arr[] = {3,3,100,3,2,10,9,9,10,0,1,3};
	int size = (sizeof(arr) / sizeof(int));
	int buy, sell;
	printf("Max Profit is - %d\n", Bursa(arr, size, &buy, &sell));
	printf("Buy Value is - %d\n", buy);
	printf("Sell Value is - %d\n", sell);
}

int Bursa(int arr[], int size, int* buy, int* sell)
{
	int min, max_profit, current_profit, i;
	max_profit = 0;
	current_profit = 0;
	min = arr[0];
	*sell = 0;
	
	for (i = 1; i < size; i++)
	{
		if (min > arr[i])
		{
			min = arr[i];
		}

		current_profit = arr[i] - min;

		if (current_profit > max_profit)
		{
			max_profit = current_profit;
			*sell = arr[i];
			*buy = min;
		}
	}
	return max_profit;
}
