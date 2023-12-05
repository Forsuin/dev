#include <stdio.h>
#include <stdlib.h>

void HybridSort(int *arr, int size);
void swap(int *x, int *y);

int main(void)
{
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

    HybridSort(arr, arrSize);

    
    printf("arr after HybridSort(): ");
    for(i = 0; i < arrSize; i++)
    {
        printf("%d ", *(arr + i));
    }
    printf("\n");

    return 0;
}

void swap(int *x, int *y)
{
    int temp = *x;
    *x = *y;
    *y = temp;
}

void HybridSort(int *arr, int size) 
{
    int i, j, maxIndex;

    /* Selection sort */
    for(i = 0; i < size - 1; i++)
    {
        maxIndex = i;

        /* Find index of max element in unsorted portion */
        for(j = i + 1; j < size; j++)
        {
            if(*(arr + j) > *(arr + maxIndex)) 
            {
                maxIndex = j;
            }
        }

        swap(arr + maxIndex, arr + i);
    }

    /* Insertion sort */
    int key = 0;

    i = 0;
    j = 0;
    maxIndex = 0;

    for(i = (size / 2); i < size; i++)
    {
        key = *(arr + i);
        j = i - 1;

        while(j >= (size / 2) && *(arr + j) > key)
        {
            *(arr + j + 1) = *(arr + j);
            j -= 1;
        }
        *(arr + j + 1) = key;
    }
}