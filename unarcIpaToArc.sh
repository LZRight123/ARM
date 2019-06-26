需求: 比如我有一个文件夹 dirA 里面有 name1.ipa name2.ipa name.ipa  我想把 这些ipa 解压缩 拿到里面的 Infoplist -> bunderID 并输出

# 我会先cd到文件夹下 这一步手动
# 1.解压文件夹下的 ipa 到 Temp 或者对应的 name 文件夹下

# 2.去Temp文件

unzip -f "./*.ipa" -d "./unzip"