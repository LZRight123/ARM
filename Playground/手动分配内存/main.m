//
//  main.m
//  手动分配内存
//
//  Created by liangze on 2020/1/11.
//  Copyright © 2020 liangze. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    int count = 0;
    void * r;
    while ((r = malloc(1024 * 1024 * 100))) {
        count++;
        
    }
    NSLog(@"可分配内存: %fG", count/1024.0/100.0);
    
    return 0;
}
