#include <stdio.h>

int ReturnSingle(int array[], int size);

int main(void){
	int array[9] = {1,2,3,4,1,3,4,5,5};
	printf("%d", ReturnSingle(array, 9));
}

int ReturnSingle(int array[], int size){

	for (int i = 0; i < size; i++){
		int flag = 0;
		for (int j = 0; j <size; j++)
		{
			if (array[i] == array[j])
			{
				flag++;
			}
		}
		if (flag < 2)
		{
			return array[i];
		}
	}
}

