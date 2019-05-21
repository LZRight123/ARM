#什么是Mach O文件格式
- .app里的可执行文件
- [资料](https://www.youtube.com/watch?v=DZy6jWYLtkY&list=PL4XMD13FgeTTa4B1MKNRI7lrPlr4izRBg&index=15&t=0s)

#为什么文件格式如此重要？ Mac/iOS
- 了解文件结构组成
- 了解可执行文件加载流程 
- 对一个文件HOOK时，注入dylib时它的原理
- 对应用进行加固，保护和混晓

#查看文件格式
- file + 文件名
- lipo -info + 文件名

#Mach-O文件格式基本结构
- Header 
  - otool -h + 文件名  //查看头部
  - otool -hv + 文件名
- Loda commands
- Data
 ```
  mageic  //文件结构类型，0xFEEDFACE是32位，0xFEEDFACF是64位
  cputype
  cpusubtype  //这两个确定CPU的平台与版本，(ARM-64)
  filetype  //文件类型(执行文件，库文件，Core，内核扩展...)
  ncmds
  sizeofncmds //这两是 Load Commands的个数和长度
  flags //dyld加载时需要要标志位
  Reserved //只有在64位才有，暂未说明
  ```
#Mach-O头部
- 魔数:很多类型的文件，其起始的几个字节是固定的。根据这几个字节的内容就可以确定文件类弄，因此这几个字节的内容被称为魔数(magic number)。
  - 通用格式(0xcafebabe)
  - armv7 (0xfeedface)
  - arm64 (oxfeedfacf)
- CPU架构
  - armv7 cputype = 12 cpusubtype=9
  - arm64 cputype = 1677228 cpusubtype = 0
- 文件类型
  - OBJECT  filetype = 1
  - EXECUTE filetype = 2
  - DYLIB   filetype = 6
- ncmds： 加载命令的个数
- sizeofncmds 加载命令所占的大小
- flags： PIE 开启地址空间随机化。ASLR

#Load Commands
- 说明了操作系统应当如何加载文件中的数据，对系统内核加载器和二甲双胍态链接器起指导作用。
  - otool -lv + 文件名
  - MachOView查看
  - MachO文件有多人段(Segement)，每个段有不同的功能，一般的段又会按不同的功能划分为几个区。
  - 各个段 segment有不同的作用 
    - LC_ENCRYPTION_INFO 加密信息 比如 crypt id = 1 ，表明架构有没有被加密，如果为1表示加密，想解密的时候，就要砸壳
    - LC_LOAD_DYLIB 要注入的动态库路径
    - LC+FUNCTION_STARTS 函数起始地址表
    - LC_CODE_SIGNATURE 代码签名的一些信息
  - __TEXT中节的分类
    - __test   主程序代码
    - __stub_helper     用于动态链接的存根
    - __symbolstub1     用于动态链接的存根
    - __objc_methname   oc的方法名
    - __objc_classname  oc的类名
    - __cstring         程序中的字符串
    ```
    $otool -s __TEXT __text xxx //二进制
    $ottol -tv xxx
    $otool -tv xxx｜head -n 10 //可视化
    ```
  - __DATA段中的节
    - __lazy_symbol
    - __nl_symbol_ptr
    - ...
  - MachO延时加载
  - codesign - dvvvv 可执行文件

  