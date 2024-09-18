#include <stdio.h>
//Function Thats Copy an Array
void CopyArray(int* array, int* user_array,int size);

int main(void)
{
	int array[] = {1, 2, 3, 4, 5};
	int size = sizeof(array)/sizeof(int); //Calculate any Array Size

	int user_array[size];
	CopyArray(array, user_array, size);

}

void CopyArray(int* array, int* user_array, int size){
	int i;
	for(i = 0; i < size; i++){
		user_array[i] = array[i];
	}
}
