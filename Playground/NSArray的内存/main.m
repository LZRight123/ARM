//
//  main.m
//  NSArray的内存
//
//  Created by liangze on 2020/1/11.
//  Copyright © 2020 liangze. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // arr 指针指向的内存区域 第一个是 isa指针， 第二个是count， 后面的数组里的内容
        NSArray *arr = @[@"第一", @"第二", @"第三"];
        NSLog(@"arr 的地址是: %p; arr.count = %ld", arr, arr.count);
        void *pointer = (__bridge void *)arr;
        NSLog(@"pointer + 1 的地址是: %p; pointer + 1 地址的值是: = %ld", ((NSUInteger *)pointer + 1), *((NSUInteger *)pointer + 1));
        *((NSUInteger *)pointer + 1) = 10;
        NSLog(@"arr 的地址是: %p; arr.count = %ld", arr, arr.count);
        
        

    }
    return 0;
}
