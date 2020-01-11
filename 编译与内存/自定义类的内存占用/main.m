//
//  main.m
//  自定义类的内存占用
//
//  Created by liangze on 2020/1/11.
//  Copyright © 2020 liangze. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>

@interface Person : NSObject
@property (nonatomic) NSString *name;
@property (nonatomic) int age;
@property (nonatomic) NSString *tip;

@end

@implementation Person
- (void)test_instance_method{}
+ (void)test_class_method{}
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // x/4wg p 第一个地址是 isa指针 , 第二 到第 四个为内容
        Person *p = [[Person alloc] init];
        p.name = @"快乐的小梁同学";
        p.age = 31;
        p.tip = @"好男人";
        [p test_instance_method];
        
        NSLog(@"p的size=%d", (int)sizeof(p));
        NSLog(@"Person 实例的size=%d", (int)class_getInstanceSize(p.class));
        
        //通过  xcrun --sdk iphoneos clang -rewrite-objc -F Foundation  -arch arm64 main.m
        //可以 在当前文件下生成 .cpp文件
        //一探类的本质:
        //
    }
    return 0;
}
