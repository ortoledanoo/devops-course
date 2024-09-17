#include <stdio.h>

void MatrixSum(int* results, int m, int n, int array[][3]);


int main(void){
	int m = 3;
	int n = 3;

	int array[3][3] = {{1,2,3},{4,5,6},{7,8,9}};
	int results[3];
	
	MatrixSum(results, m, n, array);

	for(int i = 0; i < 3; i++){
                printf("Line %d - %d \n", i, results[i]);
        }
}

void MatrixSum(int* results, int m, int n, int array[][3]){
	for(int i = 0; i < m; i++){
		int sum = 0;
		for(int j = 0; j < n; j++){
			printf("%d ", array[i][j]);
			sum+=array[i][j];
		}
		printf("\n");
		results[i] = sum;
	}
}
