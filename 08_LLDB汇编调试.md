#LLDB
- [官方文档](https://link.juejin.im/?target=https%3A%2F%2Flldb.llvm.org%2Flldb-gdb.html)
- [资料](http://visualgdb.com/gdbreference/commands/?tdsourcetag=s_pcqq_aiomsg)
- 简介：LLDB是个开源的内置于XCode的调试工具，给我们平时开发调试带来很大的便利，同时它对我们逆向分析别人的APP同样有很大的帮助

- 查看指令的用法 
  ```
  $help [cmd]
  ```
- 内存查看
  ```
  $memory read 0x地址(缩写是:x) //可以查看寄存器内存
  $memory write 0xaddress 0x65 //写入
  ```

- 寄存器操作
  ```
  $register write r0 1
  $register read  //打印寄存器list
  $p/x $lr // 查看LR funcA调用funcB，funcB结束后，会回到funcA。如果能知道LR的值就知道funcB被谁调用
  $p/x $x0 //打印寄存器地址  可以执行运算 比如 p/x 0x0064000 + 0xff 
  $x/10 $sp //打印从栈底开始连续的10个字 一般情况下，oc方法在栈中参数不会超过10个，这个命令就足够了，挨个打印 然后 po address
  $dis -a 内存地址。 通过内存看函数 拿到内存后可以通过此命令查看汇编代码
  ```
  p/x 表示输出16进制，还有 p/t(10进制) p/o(8进制)
- 查看代码段
  ```
  $image lookup -a 0x102110226 //汇编的地址
  $image lookup -t Person //快速查看一个类
  $image list //系统加载的各种文件信息
  $image list -o -f //模块偏移地址
  ```
- X命令是直接输出内存内容 格式为$x/nfu target
  ```
  $x/16xb charArray  
  $x/16xb self
  $x/c $x1 //打印X0掉用函数
  $x/s $1 
  ```
参数解释：
n，表示要显示的内存单元的个数
f，表示显示方式, 可取如下值：
参数 | 含义
---|---
x | 按十六进制格式显示变量
d | 按十进制格式显示变量
u | 按十进制格式显示无符号整型
o | 按八进制格式显示变量
t | 按二进制格式显示变量
a | 按十六进制格式显示变量
i | 指令地址格式
c | 按字符格式显示变量
s | 按字符串格式显示变量
f | 按浮点数格式显示变量
u,表示一个地址单元的长度：
参数 | 含义
---|---
b | 按单字节分段输出
h | 按双字节分段输出
w | 按四字节分段输出
g | 按八字节分段输出
target,表示内存地址，可以是变量名，也可以是内存地址。

- 断点操作
  ```
  $bt //查看堆栈列表
  $up //断下后才可以使用 往函数上一层
  $down //断下后才可以使用 往函数下一层
  $b set -n "C函数名"
  $br s -a 0x1029c28d0  //给内存地址下断点 常用
  $b -[class method] //给类的方法下断点 常用
  $b set -n "-[OC类 方法名:]"
  $b set -r 方法名: //遍历整个项目中，为所有同名的所有方法下断点 
  $br delete //删除全部断点 也可以指定index 
  $n next //遇到子函数也一并执行
  $s //单步运行，遇到子函数会进去
  $ni 和n一样 只是针对汇编 上两个是针对源代码
  $si 和s一样， 只是针对汇编
  $continue //继续执行
  $c
  $b list //查看断点列表
  $breakpoint disable //断点禁用 
  $breakpoint enable //断点启用  
  $watchpoint set variable p1->name 
  $watchpoint set expression 0x312315(一个内存地址)
  $stop-hook - 让你在每次stop的时候去执行一些命令,只对breadpoint,watchpoint
  $target stop-hook list
  $target stop-hook add -o "frame variable"
  $target stop-hook delete
  $frame select index //定位到第index层的代码位置
  $frame variable 查看所有参数，可以通过p进行修改
  $thread return 代码回滚到上一层，并退出
  ```