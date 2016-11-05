---
title: iterm2配色
tags: iterm
categories: iterm
---

iterm2配色方案

#配色来源

```
iterm2官网所提供的配色方案iTerm2-Color-Schemes
在schemes目录下提供了很多种配色方案
altercation大神的solarized配色方案solarized
在这个repo中给出了多个编辑器的配色方案，显然我们需要的是目录
iterm2-colors-solarized下的

Solarized Dark.itermcolors 和 
Solarized Light.itermcolors
```

#步骤
1. 下载配色方案
2. 首先打开home目录下的 .bash_profile 文件
    
    ```
     vim ~/.bash_profile
    ```   
	粘进去
	
	```
	export CLICOLOR=1
	LSCOLORS=gxfxcxdxbxegedabagacad
	export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '
    ```
    保存退出
    
    ```
    source ~/.bash_profile
    ```
    文件生效
    
3. 进入iterm2 
   Preferences->Profiles->Terminal 标签下的 Terminal Emulation 选择的是 xterm-new
   之后在 Preferences->Profiles->Colors 标签，点击 Load Preset 列表中的 Import 进行导入配色方案，之后进入text标签，不勾选Draw bold text in bright colors选项。
   重启iterm2