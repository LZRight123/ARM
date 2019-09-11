# [安装](https://github.com/robbyrussell/oh-my-zsh)
```
brew install zsh zsh-completions
chsh -s /bin/zsh #将zsh设置为默认shell

cat /etc/shells => 查看shells
echo $SHELL => /bin/zsh (查看默认sh)
```
1. 安装完成后在~/ 目录下会有一个 /oh-my-zsh文件 ls可以看到
```
CODE_OF_CONDUCT.md cache              oh-my-zsh.sh       tools
CONTRIBUTING.md    custom             plugins
LICENSE.txt        lib                templates
README.md          log                themes
```
plugins 就是自带的插件的位置  themes就是主题的位置
2. cd到custom ls可以看到
```
xample.zsh plugins themes
```
自定义的插件放在 plugins下
3. 安装自动补全插件
```
echo $ZSH_CUSTOM = /Users/liangze/.oh-my-zsh/custom
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions

git clone https://github.com/valentinocossar/vscode.git $ZSH_CUSTOM/plugins/vscode

```
然后 VSCode ~/.zshrc 在plugins=(git） 加上 zsh-autosuggestions zsh-syntax-highlighting zsh-completions插件
4. 安装自定义主题
```
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```
然后在 ~/.zshrc 里写上
```
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_PROMPT_ON_NEWLINE=false
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv os_icon user dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
POWERLEVEL9K_USER_ICON="\uF415" # 
POWERLEVEL9K_ROOT_ICON="\uF09C"
#POWERLEVEL9K_SUDO_ICON=$'\uF09C' # 
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
```
5. 额外插件
[iterm2可以额外安装插件，这些插件可以通过菜单栏：iterm2>install Shell integration安装](https://zhuanlan.zhihu.com/p/55123752)