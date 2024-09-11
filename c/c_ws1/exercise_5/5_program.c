#include <stdio.h>
// C Function That Flip The Order Of The digits
// For Example 1234 would be 4321
int FlipNumber(int user_input);

int main(void)
{
	int user_input;
	int i;
	printf("Please Enter a Number and I Will Flip it - ");
	scanf("%d", &user_input);
	printf("The Number Flipped is - %d\n\n", FlipNumber(user_input));
	return 0;
}

int FlipNumber(int user_input)
{
	int new_num = 0;
	while(user_input > 0)
        {
                new_num = new_num *10  + user_input%10;
                user_input /= 10;
        }
	return new_num;
}

