#include <stdio.h>
#include <assert.h>

int StrCmp(char* first_array, char* secound_array);

int main(void){
	char string_one[] = "Or Toledano";
	char string_two[] = "OToledano";
	if(StrCmp(string_one, string_two)){
		printf("The Arrays Matched");
	} else {
		printf("The Arrays NOT Matched");
	}
}

int StrCmp(char* first_array, char* secound_array){

        assert(first_array != NULL && secound_array != NULL);
	while(*first_array != '\0'){
		if(*first_array == *secound_array){
			first_array++;
			secound_array++;
		}else {
			return 0;
		}
	}
	return 1;
}


