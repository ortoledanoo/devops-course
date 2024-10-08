#include "Logger.h"

/* Add Text To File Function */
enum return_type AddToFile(const char *file_name, const char *user_input)
{
    FILE *file = fopen(file_name, "a");
    if (file == NULL)
    {
        perror("FAIL\n");
	return FAIL;
    }
    fprintf(file, "%s", user_input);
    fclose(file);
}

/* Add Text To Start Of Function */
enum return_type AddAtStart(const char *file_name, const char *user_input)
{

    size_t read_size;
    char temp[MAX * 10];
    FILE *file = fopen(file_name, "r"); /*Open For Read*/
    if (file == NULL)
    {
        perror("FAIL\n");
        return FAIL;
    }
    
    read_size = fread(temp, 1, sizeof(temp), file);
    temp[read_size] = '\0';
    fclose(file);

    file = fopen(file_name, "w"); /*Open For Write*/
    if (file == NULL)
    {
        perror("FAIL\n");
        return FAIL;
    }


    fprintf(file, "%s", user_input + 1); /*Write User Input and \n*/
    fprintf(file, "%s", temp); 
    
    fclose(file);

    printf("Text Added Successfuly at Start :)\n\n");
    return SUCCESS;
}

/* Count Lines In File Function */
enum return_type CountLines(const char *file_name, const char* user_input)
{

    int ch = 0; /* fgetc - Returns int Number and EOF is -1 */
    int count = 0;
    
    FILE *file = fopen(file_name, "r");
    if (file == NULL)
    {
        perror("FAIL\n");
	return FAIL;
    }
 
    while (!feof(file))
    {
	    ch = fgetc(file);
	    if (ch == '\n')
	    {
		    count++;
	    }
    }
    printf("\nNumber of Lines is - '%d' \n", count);
    fclose(file);
}

/* Remove File Function*/
enum return_type RemoveFile(const char *file_name, const char* user_input)
{
    if (remove(file_name) == 0) {
        printf("File Removed \n\n");
    } else {
        perror("FAIL\n");
	return FAIL;
    }
}

/* Compare User Input With Flag */
int CompareFunction(const char *user_input, const char*flag)
{
	return strcmp(flag, user_input);
}

/* Compare Only First Char */
int CompareFirstChar(const char* user_input, const char* flag)
{
	return user_input[0] == flag[0] ? 0 : 1;
}

enum return_type Exit(const char* file_name, const char* user_input)
{
	printf("\n\nBye Bye!!\n");
	return FAIL;
}
