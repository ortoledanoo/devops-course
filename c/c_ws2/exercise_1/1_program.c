#include <stdio.h>
//Function Thats Swap 2 Numbers (Sent by Adress)
void SwapNumbers(int* p_num1, int* p_num2);

int main(void)
{
	int user_num1, user_num2;
	printf("Enter 2 Numbers and I Will Flip Them\n");
	printf("Enter Number 1 - ");
	scanf("%d", &user_num1);
	printf("Enter Number 2 - ");
	scanf("%d", &user_num2);

	printf("Number 1 is - %d\n", user_num1);
	printf("Number 2 is - %d\n", user_num2);

	SwapNumbers(&user_num1, &user_num2);
	printf("**********After Swap**********\n");
        printf("Number 1 is - %d\n", user_num1);
        printf("Number 2 is - %d\n", user_num2);
}

void SwapNumbers(int* p_num1, int* p_num2)
{
	int temp;
	temp = *p_num1;
	*p_num1 = *p_num2;
	*p_num2 = temp;

}
