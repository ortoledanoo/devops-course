#include <stdio.h>

void PrintDataTypes();

int main(void){

	PrintDataTypes();

	return 0;
}

void PrintDataTypes(){
	printf("Short Int is - %ld Bytes\n", sizeof(short int));
        printf("Unsigned Short Int is - %ld Bytes\n", sizeof(unsigned short int));
        printf("Unsigned Int is - %ld Bytes\n", sizeof(unsigned int));
        printf("Int is - %ld Bytes\n", sizeof(int));
        printf("long Int is - %ld Bytes\n", sizeof(long int));
        printf("Unsigned Long Int is - %ld Bytes\n", sizeof(unsigned long int));
        printf("Unsigned Long Long Int is - %ld Bytes\n", sizeof(unsigned long long int));
        printf("Signed Char is - %ld Bytes\n", sizeof(signed char));
        printf("Unsigned Char is - %ld Bytes\n", sizeof(unsigned char));
        printf("Float is - %ld Bytes\n", sizeof(float));
        printf("Double is - %ld Bytes\n", sizeof(double));
        printf("Long Double is - %ld Bytes\n", sizeof(long double));

}
