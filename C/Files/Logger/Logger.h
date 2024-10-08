#ifndef LOGGER_H
#define LOGGER_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX 512

/*Reviewd By Linor*/

enum return_type {
	SUCCESS,
	FAIL
};

/*The Interface*/
typedef struct{
	char string[MAX];
	enum return_type (*pointer_operation)(const char* file_name, const char* user_input);
	int (*compare_operation)(const char* flag, const char* user_input);
}interface;

/*Function Decleration*/
enum return_type AddToFile(const char* file_name, const char* user_input);
enum return_type AddAtStart(const char* file_name, const char* user_input);
enum return_type CountLines(const char* file_name, const char* user_input);
enum return_type RemoveFile(const char* file_name, const char* user_input);
enum return_type Exit(const char* file_name, const char* user_input);
int CompareFunction(const char* user_input, const char* flag);
int CompareFirstChar(const char* user_input, const char* flag);

#endif
