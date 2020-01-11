
# [IDA调试技巧](https://www.jianshu.com/p/c0afd9186610)

### 传统下断点的方式
1. LLDB链接到程序
2. 调动命令
```
im li -o -f Aweme #查看二进制模块偏移
```
3.在反编译工具中查看要断点位置的基地址
4.计算偏移后的地址
```
p/x 基地址 + 偏移地址

br -s -a 地址
```
但以上存在两个问题
1.需要工具支持IDA Hopper
2.不能对已经通过运行时替换函数地址的函数

##### 改进
作为一个逆向开发新手，特分享一个以小技巧，可以免除对反汇编软件的依赖，而且拦截成功率更高。

LLDB连接到程序

##### --[模型对象 _shortMethodDescription]
找到需要下断点的类，如MMServiceCenter，然后在LLDB命令行输入po **[MMServiceCenter _shortMethodDescription]**。以微信的[MMServiceCenter getService:]断点为例，操作如下：
![image](http://cdn.iosre.com/uploads/default/original/2X/2/2273fb6049cb47c1cfbde4288c61f8583319e462.png)

然后在命令行输入br -s -a 0x100bd04f0 即可下断点


--**[模型对象 _ivarDescription]**
使用方式如上
