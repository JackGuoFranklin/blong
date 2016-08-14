---
title: mysql 更改密码
tags: mysql
categories: mysql
---



mysql 更改密码
此时我们在命令行输入

```
mysql -u root -p
```

命令会提示没有commod not found，我们还需要将mysql加入系统环境变量。

```
(1).进入/usr/local/mysql/bin,查看此目录下是否有mysql，见pic6。
(2).执行vim ~/.bash_profile
    在该文件中添加mysql/bin的目录，见pic7：
    PATH=$PATH:/usr/local/mysql/bin
添加完成后，按esc，然后输入wq保存。
最后在命令行输入source ~/.bash_profile
```

现在你就可以通过mysql -u root -p登录mysql了，会让你输入密码，就是提示的默认密码
登录成功后，你可以通过下面的命令修改密码

```
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('newpass')
```