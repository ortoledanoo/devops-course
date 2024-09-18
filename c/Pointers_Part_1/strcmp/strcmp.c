#include <stdio.h>
#include <assert.h>
//Function Thats Compare 2 Arrays
//Returns 0 When Strings Same
//Returns First String - Secound String (in ASCII)
int StrCmp(char* first_string, char* secound_string);

int main(void){
	char string_one[] = "Or Toledano";
	char string_two[] = " r Toledano";
	if(!StrCmp(string_one, string_two)){
		printf("The Arrays Matched");
	} else {
		printf("The Arrays NOT Matched");
	}
}

int StrCmp(char* first_string, char* secound_string){

        assert(first_string != NULL && secound_string != NULL);
	while(*first_string != '\0'){
		if(*first_string == *secound_string){
			first_string++;
			secound_string++;
		}else {
			return *first_string-*secound_string; //Returns The Diffrence in ASCII Value
		}
	}
	return 0;
}


