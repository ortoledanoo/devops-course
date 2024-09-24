#include "Logger.h"
/*Main Function*/
int main(int argc, char* argv[]) {

    const char *file_name = argv[1];
    char user_input[MAX];
    /*Interface Initiallization*/
    interface commands[] = 
    {
	    {"-exit\n", Exit, CompareFunction},
	    {"-remove\n", RemoveFile, CompareFunction},
	    {"-count\n", CountLines, CompareFunction},
	    {"<", AddAtStart, CompareFirstChar}
    };
    
    
    if (argc != 2)
    {
        printf("Bro didnt put the file in CLI \n");
        return 1;
    }
    


/*Infinity Loop Untill User Enter '-exit'*/
    while (1)
    {
	int i;
        int handeled = 0;
	
        printf("Hello, Please Enter a String or special Command:\n");
        printf("-exit) Will Exit The Program\n");
        printf("-count) Will Count Number Of Lines In File\n");
        printf("<) Will Put Your Text at Start of File\n");
        printf("-remove) Will Remove Your File\n");
        printf("\nYou Text - ");
        
        fgets(user_input, MAX, stdin);

        for (i = 0; i < 4; i++)
	{
		if (commands[i].compare_operation(user_input, commands[i].string) == 0)
		{
			commands[i].pointer_operation(file_name, user_input);
			handeled = 1;
			break;
		}
	}
	
	if (handeled == 0)
	{
		AddToFile(file_name, user_input);
	}	
    }

    return 0;
}
    

