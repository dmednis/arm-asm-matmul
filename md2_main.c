#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "md2.h"

int main(int argc, char **argv) {
    int  w1,h1;
    int *matrix1;

    int  w2,h2;
    int *matrix2;

    int  w3,h3;
    int *matrix3;

    int *p;

    scanf("%d", &h1);
    scanf("%d", &w1);
    matrix1 = (int*) malloc( w1 * h1 * sizeof(int));

    p = matrix1;
    for(int i = 0; i < w1*h1; i++)
    {
        scanf("%d", p++);
    }

    scanf("%d", &h2);
    scanf("%d", &w2);
    matrix2 = (int*) malloc( w2 * h2 * sizeof(int));

    p = matrix2;
    for(int i = 0; i < w2*h2; i++)
    {
        scanf("%d", p++);
    }

    h3 = h1;
    w3 = w2;
    matrix3 = (int*) malloc( w3 * h3 * sizeof(int));

    int result = matmul(h1, w1, matrix1, h2, w2, matrix2, matrix3);

    if (result == 1) {
        return 1;
    }

    printf("%d %d\n", h3, w3);
    for(int i = 0; i < w3*h3; i++)
    {
        printf("%d", matrix3[i]);
        if ((i + 1) % w3 == 0) {
            printf("\n");
        } else {
            printf(" ");
        }
    }

    return 0;
}

