#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void print_arr(int *arr, int n){
	int i;
	for(i=0;i<n;i++){
		printf("%d", arr[i]);
	}
	printf("\n");
}

void counting_sort(int *ini_arr, int *sorted_arr, int n){
	int *count_arr = (int*) malloc(sizeof(int)*100);
	int i,j,k;
	for(k=0;k<100;k++){
		count_arr[k] = 0;
	}
	for(i=0; i<n; i++){
		count_arr[ini_arr[i]]++;
	}
	for(j=1; j<n; j++){
		count_arr[j]+=count_arr[j-1];
		// 累加
	}
	for(i=n; i>0; i--){
		sorted_arr[--count_arr[ini_arr[i-1]]]=ini_arr[i-1];
	}
	free(count_arr);
		
}

int main(){
	int n = 10;
	int i;
	int *arr = (int *)malloc(sizeof(int) *n);
	int *sorted_arr =(int *)malloc(sizeof(int) *n);
	srand(time(0));
	for(i=0; i<n; i++){
		arr[i]=rand()%100;
	}
	printf("ini_array:");
	print_arr(arr, n);
	counting_sort(arr, sorted_arr,n);
	printf("sorte arry:");
	print_arr(sorted_arr,n);
	free(arr);
	free(sorted_arr);
	return 0;

}
