#include <stdio.h>
#include <assert.h>
int StrLen(char* first_char);

int main(void){
	char string [] = "Or Toledano";
	printf("The Length of String is - %d\n\n", StrLen(string));
	//'string' = address of first char in array
}

int StrLen(char* first_char){

	assert(first_char != NULL);
	int count = 0;
	for(count = 0; *first_char != '\0'; count++){
		first_char++;
	}
	return count;
}


