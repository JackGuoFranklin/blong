---
title： 使用hexo 教程
---
### 安装git
我选用了Homebrew来安装mac下的软件，你可以先安装
Homebrew
##### 安装Homebrew

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

##### 成功之后安装git

```
brew install git
```

### 安装node.js

去[nodes.js](https://nodejs.org/en/) 官网下载，安装即可。

### 配置SSH keys
打开GitHub，进入设置界面，点击左边的SSH keys，添加一个SSH keys。

1.输入以下代码生成新的key文件

```
ssh-keygen -t rsa -C "邮件地址@youremail.com"
```

这里的邮件地址填自己注册时的邮件地址，注意大小写，双引号不能省略，终端会返回代码让你确定文件名，回车就好。

```
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/DoubleD/.ssh/id\_rsa): //回车就行
```
接着会让你输入加密串，可以空着：

```
Enter passphrase (empty for no passphrase):\<输入加密串\>
Enter same passphrase again:\<再次输入加密串\>
```

成功的创建了一个SSH key。

找到本机上的id_rsa.pub文件,打开它（建议使用Sublime Text）复制里面的代码.添加到SSH key 中

然后点击Add key就配置好了SSH key

测试是否配置成功

```
ssh -T git@github.com
```
看到

```
 You've successfully authenticated, but GitHub does not provide shell access.
```
表示配置成功了。

完成之后，我们设置好个人信息，用于提交代码说明是谁提交的，怎么联系。可以用以下指令完成：

```
git config --global user.name "你的名字"
git config --global user.email  "你的邮箱"
```

### 安装Hexo

打开终端，输入以下指令：

```
npm install -g hexo

```

注意如果不能安装可能被墙了，换源在终端输入

```
npm config set registry="http://registry.cnpmjs.org"
```

如果还出问题  在前面加入sudo 在管理员权限下上面的命令

```
sudo npm config set registry="http://registry.cnpmjs.org"
```

提示输入密码，输入管理员密码就可了。

然后在终端输入

```
npm install -g hexo

```
重新安装一下。

安装后，进入你要存博客的目录，在该目录下执行如下命令

```
hexo init
npm install
```
Hexo就会在该文件夹建立博客所需要的所有文件。本地的Hexo博客已经初步搭建起来，输入以下指令：

```
hexo generate//可以简写为 hexo g
hexo server//可以简写为 hexo s
```

就可以在浏览器中输入localhost:4000查看本地博客了。如果不能查看请输入
127.0.0.1:4000查看。在不行了。就是没有成功从hexo init重新来一次就可以了。要注意的是，所有的hexo指令都必须在你所建立的目录下执行。

###部署Hexo到GitHub上

安装一个插件

```
npm install hexo-deployer-git --save

```

然后打开博客目录的_config.yml文件，设置deploy的type为git，repository(repo)
为：https://github.com/你的id/你的id.github.io.git（需要在type和repo后面加上一个空格再填写）。

然后输入

```
hexo g
hexo deploy//可简写为 hexo d

```

在浏览器中输入

```
http://你的id.github.io/
```
就可以访问自己的博客了。