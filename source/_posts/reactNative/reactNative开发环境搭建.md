---
title: reactNative开发环境搭建
tags: 
- reactNative
categories: reactNative
date: 2017-11-21
---

reactNative开发环境搭建

# (一) 搭建基本环境（必要）

## 1.安装Homebrew

打开终端，运行以下语句（中间需要输入密码）进行安装：

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
可通过如下语句查看安装是否成功以及安装的Homebrew版本：

```
brew -v
```
正常情况下均可安装成功，若出现网络问题安装失败，则运行如下语句清理后再重新安装：

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## 2. 使用Homebrew来安装Node.js

使用brew安装node.js

终端运行语句如下：

```
brew install node
```
查看安装是否成功以及安装的node.js版本：

```
node -v
```

## 3. 安装React Native的命令行工具（react-native-cli）


React Native的命令行工具用于执行创建、初始化、更新项目、运行打包服务（packager）等任务。

终端运行语句如下：

```
npm install -g react-native-cli
```
若出现错误（可能由于权限不足），则实用以下语句进行安装：

1
sudo npm install -g react-native-cli
由于国内网络问题，可以将npm仓库替换为国内镜像

```
//将npm仓库替换为国内镜像：
npm config set registry https://registry.npm.taobao.org --global
npm config set disturl https://npm.taobao.org/dist --global
```

#(二) 推荐安装的工具

## 1. Watchman

Watchman是由Facebook提供的监视文件系统变更的工具。安装此工具可以提高开发时的性能（packager可以快速捕捉文件的变化从而实现实时刷新）。

终端运行语句安装：

```
brew install watchman
```
查看安装是否成功以及安装的watchman版本：

```
watchman -v
```

## 2. Flow

Flow是一个静态的JS类型检查工具，可方便找出代码中可能存在的类型错误。
译注：你在很多示例中看到的奇奇怪怪的冒号问号，以及方法参数中像类型一样的写法，都是属于这个flow工具的语法。这一语法并不属于ES标准，只是Facebook自家的代码规范。

终端运行语句安装：

```
brew install flow
```
查看安装是否成功以及安装的flow版本：

```
flow --version
```
