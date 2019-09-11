# 检查java环境
```
java -version
java version "12.0.2" 2019-07-16
Java(TM) SE Runtime Environment (build 12.0.2+10)
Java HotSpot(TM) 64-Bit Server VM (build 12.0.2+10, mixed mode, sharing)
```
1. 完全卸载java
```
sudo rm -rf /Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin
sudo rm -rf /Library/PreferencesPanes/JavaControlPanel.prefPane
sudo rm -rf ~/Library/Application\ Support/Java
sudo rm -rf  /Library/Java/JavaVirtualMachines/jdk.xxxx
```

2. 安装[javase官网下载](https://www.oracle.com/technetwork/java/javase/downloads/jdk12-downloads-5295953.html)
```
javac  有输出
jshell 交互型编译器
```
3. intelliJ idea [传送门](https://www.jetbrains.com/idea/)

4. 查看jdk安装版本 目录 列表，以及默认使用的
```
/usr/libexec/java_home -V
Matching Java Virtual Machines (1):
    12.0.2, x86_64:	"Java SE 12.0.2"	/Library/Java/JavaVirtualMachines/jdk-12.0.2.jdk/Contents/Home

/Library/Java/JavaVirtualMachines/jdk-12.0.2.jdk/Contents/Home
```

5. 配置JAVA_HOME等环境变量
```
/usr/libexec/java_home
=> /Library/Java/JavaVirtualMachines/jdk-12.0.2.jdk/Contents/Home
这是Mac上专门用来管理JAVA_HOME的文件，我们可以靠它轻松得到不同版本的JAVA_HOME
vs ~/.zshrc 或者 ~/.bash_profile
写入 export JAVA_HOME="/usr/libexec/java_home"
```
很明显可以看出，java_home这个文件的作用是映射到了/Library/Java/JavaVirtualMachines/jdk-12.0.2.jdk/Contents/Home
mac下的jdk都默认安装在/Library/Java/JavaVirtualMachines下面），得到了我安装的jdk-12.0.2的JAVA_HOME。
在 ~/.zshrc 或者 ~/.bash_profile 添加
```
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-12.0.2.jdk/Contents/Home"
PATH=$JAVA_HOME/bin:$PATH
CLASSPATH=$JAVA_HOME/lib
```
保存退出

6. 卸载Android Studio
- 卸载Android Studio
```
sudo rm -rf /Applications/Android\ Studio.app  
rm -rf ~/Library/Preferences/AndroidStudio*  
rm ~/Library/Preferences/com.google.android.studio.plist  
rm -rf ~/Library/Application\ Support/AndroidStudio*  
rm -rf ~/Library/Logs/AndroidStudio*  
rm -rf ~/Library/Caches/AndroidStudio*
```
- 卸载Android Virtual Devices(AVDs) and *.keystore
```
rm -rf ~/.android
```
- 删除Android SDK Tools
```
rm -rf ~/Library/Android*
```

7. 安装
- 点dmg安装后 选custom 勾选Android Virtual Device
- Android SDK Location: ~/Library/Android/sdk (可自定义)