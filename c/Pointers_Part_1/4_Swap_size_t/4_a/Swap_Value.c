#include <stdio.h>

void Swap(size_t* num_1, size_t* num_2);

int main(void){
	size_t num_1 = 10;
	size_t num_2 = 20;

	Swap(&num_1, &num_2);

	printf("Number 1 - %lu \nNumber 2 - %lu \n\n", num_1, num_2);


}

void Swap(size_t* num_1, size_t* num_2){
	size_t temp;
	temp = *num_1;
	*num_1 = *num_2;
	*num_2 = temp;
}

