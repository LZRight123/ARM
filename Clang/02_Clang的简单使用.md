#0x00 编译OC
cd到Clang文件夹下，touch main.m 写入代码
```
$clang -fobjc-arc -framework Foundation main.m -o hello //生成执行文件 hello
$clang -rewrite-objc main.m // 查看oc的c实现 生成一个main.cpp文件
```
指令解释
  - -fobjc-arc表示编译需要支持ARC特性。
  - -framework Foundation表示引用Foundation框架，这个框架中定义了很多基本的类，例如字符串、数组、字典等等。
  - 后面的main.m就是待编译的源代码文件名
  - -o hello表示输出的可执行文件的文件名是hello。

#0x04 查看编译源文件需要的几个不同的阶段
```
$clang -ccc-print-phases main.m //可以看到编译源文件需要的几个不同的阶段
=>
0: input, “main.m”, objective-c
1: preprocessor, {0}, objective-c-cpp-output
2: compiler, {1}, ir
3: backend, {2}, assembler
4: assembler, {3}, object
5: linker, {4}, image
6: bind-arch, “x86_64”, {5}, image
```

#0x08 想看清clang的全部过程，可以先通过-E查看clang在预编译处理这步做了什么。
```
clang -E main.m
=>
# 1 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk/System/Library/Frameworks/Foundation.framework/Headers/FoundationLegacySwiftCompatibility.h" 1 3
# 185 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk/System/Library/Frameworks/Foundation.framework/Headers/Foundation.h" 2 3
# 3 "main.m" 2

int main(int argc, const char * argv[]){
    @autoreleasepool {
        NSLog(@"hello world");
    }
    return 0;
}
```
- 预处理完成后就会进行词法分析，这里会把代码切成一个个 Token，比如大小括号，等于号还有字符串等。
```
$clang -fmodules -fsyntax-only -Xclang -dump-tokens main.m
```
- 然后是语法分析，验证语法是否正确，然后将所有节点组成抽象语法树 AST 。
```
$clang -fmodules -fsyntax-only -Xclang -ast-dump main.m
```
- 完成这些步骤后就可以开始IR中间代码的生成了，CodeGen 会负责将语法树自顶向下遍历逐步翻译成 LLVM IR，IR 是编译过程的前端的输出后端的输入。
```
$clang -S -fobjc-arc -emit-llvm main.m -o main.ll //这里 LLVM 会去做些优化工作，在 Xcode 的编译设置里也可以设置优化级别-01，-03，-0s
```
- 如果开启了 bitcode 苹果会做进一步的优化，有新的后端架构还是可以用这份优化过的 bitcode 去生成。
```
$clang -emit-llvm -c main.m -o main.bc
```
- 生成汇编
```
$clang -S -fobjc-arc main.m -o main.s
```
- 生成目标文件
```
$clang -fmodules -c main.m -o main.o
```
- 生成可执行文件
```
$clang main.o -o hello
```

#0x0c clang用法扩展
1. 把oc代码转写成c/c++代码
   ```
   $clang -rewrite-objc main.m
   ```
2. 指定SDK,有的oc代码要转成c代码时，在真机和模拟器上差别还是挺大的。如果需要指定SDK，那么要结合xcrun命令： 
   ```
   $xcrun -sdk iphoneos clang -rewrite-objc main.m //指定真机
   $xcrun -sdk iphonesimulator clang -rewrite-objc main.m //指定模拟器
   $xcrun -sdk iphonesimulator9.3 clang -rewrite-objc main.m //模拟器和真机都有默认的SDK版本，也可以指定具体某版本
   ```
   当然，你要先看看你机器上都装哪些SDK，xcodebuild命令可以完成这个任务：
   ```
   $xcodebuild -showsdks
   ```
3. 指定framework,-F path 如果使用了第三SDK，例如（main.m文件 用了听云sdk NBSAppAgent）：
   tingyunApp.framework在/Users/goanywhere/Downloads/nbs-newlens-ios-2.3.6下，于是修改指令为： 
   ```
   $xcrun -sdk iphonesimulator9.3 clang -rewrite-objc –F /Users/goanywhere/Downloads/nbs-newlens-ios-2.3.6  main.m
   ```
