#include <stdio.h>

size_t JosephusProblem(const size_t N, size_t k);

int main(void){
	printf("Josephus Problem\n");
	
	size_t N;
	int k;

	printf("Please Enter Soilders Number - ");
	scanf("%ld", &N);

	printf("\nEnter k - ");
	scanf("%d", &k);

	printf("The Winner is - %ld \n\n", JosephusProblem(N, k));

	return 0;

}



size_t JosephusProblem(const size_t N, size_t k){
	
        int alive_soilders = N;
        int i = 0;
        int killed = 0;
        int soilders[N];

        for(size_t j = 0; j < N; j++)
        {
                soilders[j] = 0;
        }

        while (alive_soilders > 1)
        {

                if(soilders[i] == 0){
                        killed++;
                }

                if(killed == k)
                {
                        soilders[i] = 1;
                        alive_soilders--;
                        killed = 0;
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
