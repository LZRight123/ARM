//
//  main.m
//  探索Struct内存分布
//
//  Created by liangze on 2020/1/11.
//  Copyright © 2020 liangze. All rights reserved.
//

#import <Foundation/Foundation.h>

struct person {
    NSString *name;
    NSString *tip;
    int age;
    int sex; // 1男 2女
    NSString *nickname;
};


struct parent_node {
    NSString *name;
    int age;
    NSString *nickname;
};

struct child_node { // size of = 32
    struct parent_node parent; // sizof = 24
    int money; // sizeof = 4
};

int main(int argc, const char * argv[]) {
    // 结构体是值 类型 直接指向数据空间 而不是指向一个地址 再让这个地址指像一个数据空间
    struct person n = {@"梁泽", @"好男人", 31, 1, @"快乐的小梁同学"};
    printf("结构体的大小是: %d, 地址是: %p \n", (int)sizeof(n), &n);
    // 通过 x/4wg &n  ,打印内存地址内容可以知道 name tip age sex nickname 是连续的内存, age sex 各占4个字节 0x000000010000001f
    
    // 嵌套结构体
    struct child_node nodel = {{@"梁泽", 31, @"快乐的小梁同学"}, 987};
    printf("结构体的大小是: %d, 地址是: %p \n", (int)sizeof(nodel), &nodel);
    // 通过 x/4wg &n  ,打印内存地址内容可以知道 parent.name parent.age parent.nickname money 内存是连续的
    // 因为内存连续分布 所以可以强转成 parent_node，然后取属性，和上面 Block内存分析 一样
    struct parent_node * pointer = (struct parent_node *)(&nodel);
    NSLog(@"===%@, %d, %@, %@", pointer->name, pointer->age, pointer->nickname, (&nodel)->parent.name);
}
