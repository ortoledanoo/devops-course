#include <stdio.h>
//C Function Power By 10 
//Deals with Negative Numbers and 0
double PowerByTen(int user_input);

int main(void)
{
	int user_input;
	printf("Enter a Number and i will power 10 by your number - ");
	scanf("%d", &user_input);
	printf("number 10 power by %d is - %lf\n", user_input, PowerByTen(user_input));
}

double PowerByTen(int user_input)
{
	int i;
	double result = 1;
	int abs_input;
	abs_input = user_input>0 ? user_input : -user_input;

	for (i = 0; i < abs_input; i++)
	{
		result*=10;
	}

	return user_input>0 ? result : 1/result;
}
