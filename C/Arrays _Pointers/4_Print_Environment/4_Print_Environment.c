#include <stdio.h> 
#include <string.h> //strcpy/strlen
#include <stdlib.h> //Malloc/Free
#include <ctype.h> //For LowerCase Function (tolower)
#include <assert.h> //assert

void LowerCase(char *str);

void CopyArray(const char *old_array[],char *new_array[], size_t size);

size_t EnvLen(char *env[]);

int main(int argc, char **argv,const char *env[])
	
{
    size_t size = 0;
    while (env[size] != NULL) //Count How Much ENV Var
    {
	    size++;
    }
   
    char *array[size]; // Create Array For Vars
	
    CopyArray(env, array, size);
   

    // Print new array
    for (size_t j = 0; j < size; j++)
    {
        LowerCase(array[j]);
	printf("%s \n\n", array[j]);
        free(array[j]); // Free the allocated memory
    }

    return 0;
}

void LowerCase(char *str) {
    assert (str != NULL);
    while (*str) {
        *str = tolower(*str);
        str++;
    }
}

void CopyArray(const char *old_array[],char *new_array[], size_t size)
{
    size_t i = 0;
    while (old_array[i] != NULL && i < 48)//First, make sure not NULL secound make sure its in range
    {
        // Allocate memory  for each array element (individual to his length)
        new_array[i] = (char *)malloc(strlen(old_array[i])+1);
        assert (new_array[i] != NULL); // Check if allocated

        strcpy(new_array[i], old_array[i]);
        i++;
    }
}

size_t EnvLen(char *env[]){
	
	char **count = env;
	while ((size_t *)count != NULL)
	{
		count++;
	}
	
	return count - env;


}
