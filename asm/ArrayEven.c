#include <stdio.h>
#include <stdlib.h>

void MakeAllEven(int *arr, int arrSize);

int main(void) {
    int arrSize;

    printf("Enter the array size: ");
    scanf("%d", &arrSize);

    int *arr = malloc(arrSize * sizeof(int));

    int i = 0;
    for(; i < arrSize; i++)
    {
        printf("Enter arr[%d]: ", i);
        scanf("%d", (arr + i));
    }

    MakeAllEven(arr, arrSize);

    printf("arr after MakeAllEven(): ");
    for(i = 0; i < arrSize; i++)
    {
        printf("%d ", *(arr + i));
    }
    printf("\n");

    return 0;
}

void MakeAllEven(int *arr, int arrSize) 
{
    int i = 0;
    for(; i < arrSize; i++)
    {
        if(*(arr + i) % 2 != 0)
        {
            *(arr + i) += 1;
        }
    }
}