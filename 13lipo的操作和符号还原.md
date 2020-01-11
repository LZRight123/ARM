
##### lipo的相关操作


[这是block符号还原的链接](https://www.jianshu.com/p/c0a60b025e25)
```
#查看二进制文件的架构
lipo -info

#App瘦身
lipo machO文件路径 -thin arm64 -output 瘦身后的machO文件路径

```
##### 符号还原


```
#还原命令
restore-symbol machO文件路径 -o 还原后的machO文件路径

#用还原后的二进制文件替换原来的二进制文件
//例如
mv snapchat_symbol snapchat


#重新生成ipa
#替换原来的machO文件，然后在Payload文件夹使用命令
zip –ry 输出文件 输入文件
zip -ry newIPA.ipa Payload

```


##### 恢复Block的符号表
[参考链接](https://github.com/tobefuturer/restore-symbol)

- 用法
用IDA打开需要分析的二进制文件
加载ida_search_block.py文件，使用如下
![image](https://upload-images.jianshu.io/upload_images/6918700-9f56f9822b862f25.png)
执行生成block_symbol.json文件，生成的文件位置和分析的二进制文件同一目录

使用以下命令恢复

```
#生成
./restore-symbol 目标二进制文件 -o 生成的二进制文件_block -j block_symbol.json

#替换
mv  生成的二进制文件_block   目标二进制文件

```
