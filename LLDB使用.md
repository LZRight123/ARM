### 断点设置

###### 如果有不会的可以查看[LLDB官方文档](https://lldb.llvm.org/use/map.html)

```
- 设置地址
br s -a addr  //eg  br s -a 0x0000193c  或者 br s -a  0x0000193b + 0x00013bc
或者
b  addr  // b 0x0000193c

- 设置方法名断点

breakpoint/b set -n xxx  //xxx:方法名

- 在名为main的所有函数上设置断点。
br s -n main

-在文件的某一行下断点
br s -f test.c -l 12 
#或者
b test.c:12

-通过函数名称下断点
(lldb) breakpoint set --name "-[NSString stringWithFormat:]"
(lldb) br s -n "-[NSString stringWithFormat:]"
(lldb) b -[NSString stringWithFormat:]

```

###  expression命令
#### 打印变量

print 简写p 是 expression -- 别名，打印基本数据类型。

po 是 expr -o -- 的别名。

```
(lldb) expr -o -- [SomeClass returnAnObject]
or using the po alias:
(lldb) po [SomeClass returnAnObject]

```

以特定格式打印变量
下面分别以16进制（x），字符（c），二进制（t）打印变量


```
(lldb) p/x 2
(int) $0 = 0x00000002
```


```
lldb) p/c (char)97
(char) $2 = 'a'
```


```
(lldb) p/t 2
(int) $4 = 0b00000000000000000000000000000010
```

### 调试信息
- frame info 可以查看当前调试的行数和源码信息

```
(lldb) frame info
frame #0: 0x0000000104cc6d1c TestPAD`-[ViewController testParam:b:c:d:](self=0x0000000149d0aaa0, _cmd="testParam:b:c:d:", a=10, b=20, c=30, d=40) at ViewController.m:31

```

- thread info 可以查看当前调试线程、行数、和源码信息


```
(lldb) thread info 
thread #1: tid = 0xfb0ab5, 0x0000000104cc6d1c TestPAD`-[ViewController testParam:b:c:d:](self=0x0000000149d0aaa0, _cmd="testParam:b:c:d:", a=10, b=20, c=30, d=40) at ViewController.m:31, queue = 'com.apple.main-thread', stop reason = breakpoint 9.1

```
- thread list 可以查看当前所有线程的调试状态


```
lldb) thread list
Process 29252 stopped
* thread #1: tid = 0xfb0ab5, 0x0000000104cc6d1c TestPAD`-[ViewController testParam:b:c:d:](self=0x0000000149d0aaa0, _cmd="testParam:b:c:d:", a=10, b=20, c=30, d=40) at ViewController.m:31, queue = 'com.apple.main-thread', stop reason = breakpoint 9.1
  thread #3: tid = 0xfb0ad8, 0x000000018608fdf4 libsystem_dnssd.dylib`ConvertHeaderBytes, queue = 'com.skyeye.analytics.network.queue'
  thread #4: tid = 0xfb0ad9, 0x00000001860f5dbc libsystem_kernel.dylib`__workq_kernreturn + 8
  thread #5: tid = 0xfb0ada, 0x0000000186206c1c libsystem_pthread.dylib`start_wqthread
  thread #6: tid = 0xfb0adb, 0x00000001860d4bc4 libsystem_kernel.dylib`mach_msg_trap + 8, queue = 'com.SkyEye.905541C85D654B539C85DEECF2689651.0x1c0462b00.network'
  thread #7: tid = 0xfb0adc, 0x00000001860d4bc4 libsystem_kernel.dylib`mach_msg_trap + 8, name = 'com.apple.uikit.eventfetch-thread'
  thread #8: tid = 0xfb0ade, 0x00000001860f5c1c libsystem_kernel.dylib`__ulock_wait + 8, queue = 'com.skyeye.analytics.interface.queue'
  thread #9: tid = 0xfb0ae0, 0x00000001860d4bc4 libsystem_kernel.dylib`mach_msg_trap + 8, name = 'com.apple.NSURLConnectionLoader'
```

- frame variable（简写 fr v）当前调试堆栈的所有参数和临时变量


```
(lldb) frame variable
(ViewController *) self = 0x0000000149d0aaa0
(SEL) _cmd = "testParam:b:c:d:"
(int) a = 10
(int) b = 20
(int) c = 30
(int) d = 40
(int) ii = 10000

```

- register read 返回当前线程通用寄存器的值（对64为对应x0-x31）

```
lldb) register read
General Purpose Registers:
        x0 = 0x0000000149d0aaa0
        x1 = 0x0000000104d9dd46  "testParam:b:c:d:"
        x2 = 0x000000000000000a
        x3 = 0x0000000000000014
        x4 = 0x000000000000001e
        x5 = 0x0000000000000028
        x6 = 0x0000000000000000
        x7 = 0x000000016b156808
        x8 = 0x0000000104dd9330  "testParam:b:c:d:"
        x9 = 0x0000000000000000
       x10 = 0x0086860100868680
       x11 = 0x0000000000868601
       x12 = 0x0000000000868500
       x13 = 0x0000000000000001
       x14 = 0x0000000000000000
       x15 = 0x00868601008686c0
       x16 = 0x0000000000000000
       x17 = 0x0000000104cc6cf4  TestPAD`-[ViewController testParam:b:c:d:] at ViewController.m:29
       x18 = 0x0000000000000000
       x19 = 0x00000001b70ab8c0  UIKit`_UIApplicationLinkedOnVersion
       x20 = 0x0000000149d0aaa0
       x21 = 0x0000000000000018
       x22 = 0x0000000190799d6a  "count"
       x23 = 0x0000000000000000
       x24 = 0x0000000000000000
       x25 = 0x000000014a017c00
       x26 = 0x0000000000000408
       x27 = 0x00000001c0099410
       x28 = 0x0000000000000000
        fp = 0x000000016b157f60
        lr = 0x0000000104cc6bbc  TestPAD`-[ViewController viewDidLoad] + 164 at ViewController.m:24
        sp = 0x000000016b157f30
        pc = 0x0000000104cc6d1c  TestPAD`-[ViewController testParam:b:c:d:] + 40 at ViewController.m:31
      cpsr = 0x20000000


```


-  memory read （简写x）以给定格式读取给定内存地址数据

（1）比如以字符串读取x1寄存器的值
```
(lldb) memory read -f s $x1
或者
(lldb) x -f s $x1
或者
(lldb) x/s $x1
输出为：
0x104d9dd46: "testParam:b:c:d:"
```
（2）读取栈中所有值，即sp和fp连续内存区域值。

```
(lldb) x -f A $sp $fp

```
(3)每多少字节读取某个地址
```
memory read --size 8 --format x 0x17425ff20
#或者
x/8 0x17425ff20

#node:函数指针占8个字节，int占4个字节
```

##### 几个实用的命令


- 查看层级

```
pviews
```


- 查看某个控件的响应链

```
presponder 0x1133d32
```

- 查看按钮Action事件

```
pactions 0x1133d32
```

- 查看block参数

```
pblock 0x134a32d
```


- 查看某个对象所有的方法

```
methods 0x13d42
```


- 搜索UITextField的实例对象及地址

```
search UITextField
```
- 对某个类所有的方法下断点并跟踪打印调用参数，
bclass 

```
//例如
blcass LoginViewController
br command  add 1
Enter your debugger command(s). Type 'DONE' to end

> po $0  //打印第一个参数（调用类）
> x/s $1 //打印方法
> c     //下一步
> DONE
```


- 查看某个地址所在模块的信息
- image lookup

```
//例如
(lldb) b [LoginRegiseterViewController snapchatterButtonClicked]
Brekpoint 1: where = Snapchat -[LoginRegiseterViewController snapchatterButtonClicked],
address = 0x0000012da2

(lldb) c
 Process 18474 resuming
 
 (lldb) image lookup -a 0x0000012da2
 Adress: ---对应的偏移地址-----
 Summary: ---对应的函数信息---
```

---
对模块中进行模糊查询有关的符号信息
- image lookup -rn

```
#查看snapchat中所有带有login字符串的符号信息

(lldb)image lookup -rn login snapchat

 Adress: ---对应的偏移地址-----
 Summary: ---对应的函数信息---
 等等
 
```













