//
//  main.c
//  C可变数组
//
//  Created by liangze on 2020/1/11.
//  Copyright © 2020 liangze. All rights reserved.
//

#include <stdio.h>

typedef struct {
    int *array;
    int size;
} Array;

Array array_create(int init_size);
void array_free(Array *a);
int array_size(const Array *a);
int *array_at(Array *a, int index);
void array_inflate(Array *a, int more_size);

int main(int argc, const char * argv[]) {
    
    return 0;
}
