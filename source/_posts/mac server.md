---
title: mac localhost server
tags: mac
categories: mac
---


1
建立方式很简单，直接在终端中运行：

```
sudo mkdir ~/Sites
```

2建立“站点”文件夹之后，检查 /etc/ 文件夹下面是不是有“haibor.conf”这个文件：

```
/etc/apache2/users/
```
如果没有，那么你需要创建一个，取名为“你的名字.conf”，可以使用 vi 或者 nano 这两种编辑器之一来创建。

```
sudo vi /etc/apache2/users/你的名字.conf
```
创建之后将下面的这几行内容写到上面的 conf 文件中：

```
<Directory "/Users/你的名字/Sites/">
    Options Indexes MultiViews
    AllowOverride All
    Order allow,deny
    Allow from all
</Directory>
```
3
文件保存之后，给它赋予相应的权限：

```
sudo chmod 755 /etc/apache2/users/你的名字.conf
```

4接下来重启 Apache，以使该配置文件生效：

```
sudo apachectl restart
```

