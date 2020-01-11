//
//  main.m
//  Block转C内存占用
//
//  Created by liangze on 2020/1/11.
//  Copyright © 2020 liangze. All rights reserved.
//


//MARK: - xcrun --sdk iphoneos clang -rewrite-objc -arch arm64 main.m

int main(int argc, char * argv[]) {
    void (^block)() = ^{
        int a =1;
        int b = 2;
        int r = a + b;
    };
    block();
}
