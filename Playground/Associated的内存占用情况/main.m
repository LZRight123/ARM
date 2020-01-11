//
//  main.m
//  Associated的内存占用情况
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

@interface Person(accociated)
@property (nonatomic) NSString *nickname;
@end

@implementation Person
- (void)setNickname:(NSString *)nickname{
    objc_setAssociatedObject(self, "nickname", nickname, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)nickname{
    return objc_getAssociatedObject(self, "nickname");
}
@end

@implementation Person(accociated)
@end

int main(int argc, const char * argv[]) {
    Person *p = [[Person alloc] init];
    p.name = @"梁泽";
    p.age = 31;
    p.tip = @"好男人";
    p.nickname = @"快乐的小梁同学";
    
    NSLog(@"p的size=%d", (int)sizeof(p));
    NSLog(@"Person 实例的size=%d", (int)class_getInstanceSize(p.class));
    NSLog(@"nickname = %@", p.nickname);
    // 由于类的size大小还是32
    // setAssociatedObject 是让一块内存的数据和 Person关联起来 拥有一样的生命周期而已
    
}
