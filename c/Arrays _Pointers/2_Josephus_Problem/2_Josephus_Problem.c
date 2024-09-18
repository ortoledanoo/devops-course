#include <stdio.h>

size_t JosephusProblem(const size_t soilders, size_t jumps);

int main(void){
	printf("Josephus Problem\n");
	
	size_t soilders;
	size_t jumps;

	printf("Please Enter Soilders Number - ");
	scanf("%ld", &soilders);

	printf("\nEnter jumps - ");
	scanf("%d", &jumps);

	printf("The Winner is - %ld \n\n", JosephusProblem(soilders, jumps));

	return 0;

}



size_t JosephusProblem(const size_t soilders, size_t jumps){
	
        size_t alive_soilders = soilders;
        size_t i = 0; //Index in Array
        size_t flag = 0; //Flag 
        size_t soilders[N]; // Array of Soilders

        for(size_t j = 0; j < N; j++)
        {
                soilders[j] = 0;
        }

        while (alive_soilders > 1)
        {

                if(soilders[i] == 0){
                        flag++;
                }

                if(flag == k)
                {
                        soilders[i] = 1;
                        alive_soilders--;
                        flag = 0;
                }

                i++;
                if(i == N)
                {
                        i = 0;
                }


        }

        for(size_t i = 0; i < N; i++){
                if(soilders[i] == 0){
                        return (i+1);
                }
        }


}
