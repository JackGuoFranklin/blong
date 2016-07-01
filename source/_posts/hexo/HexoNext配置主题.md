---
title: Hexo Next 配置主观
tags: 
- hexo
- next
categories: hexo
---

### 语言设置

在主目录下_config.yml 中配置

```
language: zh-Hans
```

语言 | 代码 | 设定值
---- | --- | ----
English | en   | language: en
简体中文 |  zh-Hans   | language: zh-Hans

### 菜单设置

菜单配置在 主题配置文件的 menu

菜单示例配置：

```
menu:
  home: /
  archives: /archives
  #about: /about
  #categories: /categories
  tags: /tags
  #commonweal: /404.html
```

### 侧栏设置

配置选项

* post - 默认行为，在文章页面（拥有目录列表）时显示
* always - 在所有页面中都显示
* hide - 在所有页面中都隐藏（可以手动展开）

侧栏示例配置：

```
sidebar: post
```
### 头像设置

新增字段 avatar

1 完整的互联网 URL	https://avatars1.githubusercontent.com/u/32269?v=3&s=460

2 站点内的地址	/uploads/avatar.jpg - 需要将你的头像图片放置在 站点的 source/uploads/ （可能需要新建uploads目录）

3 /images/avatar.jpg - 需要将你的头像图片放置在 主题的 source/images/ 目录下

### 作者名称

设置 author 为你的昵称

### 站点描述设置

设置 description 字段为你的站点描述。

### 添加「标签」页面
1 定位到 Hexo 站点目录下

```
hexo new page tags
```

2编辑刚新建的页面，将页面的类型设置为 tags 

```
title: 标签
type: "tags"
```
3  添加 tags 到 menu 中

```
menu:
  home: /
  archives: /archives
  tags: /tags
```

### 添加「分类」页面

1 定位到 Hexo 站点目录下

```
hexo new page categories
```

2编辑刚新建的页面，将页面的类型设置为 categories 

```
title: 标签
type: "categories"
```
3  添加 categories 到 menu 中

```
menu:
  home: /
  archives: /archives
  categories: /categories
```


### 设置代码高亮主题

NexT 默认使用的是 白色的 normal 主题,可选的值有 normal，night， night blue， night bright， night eighties.
 
更改 highlight_theme 字段，将其值设定成你所喜爱的高亮主题，例如：

```
# Code Highlight theme
# Available value: normal | night | night eighties | night blue | night bright
# https://github.com/chriskempson/tomorrow-theme
highlight_theme: normal
```

### 侧边栏社交链接
1
接放置在 social 字段下，一行一个链接。其键值格式是 显示文本: 链接地址。

```
# Social links
social:
  GitHub: https://github.com/your-user-name
  Twitter: https://twitter.com/your-user-name
  微博: http://weibo.com/your-user-name
  豆瓣: http://douban.com/people/your-user-name
  知乎: http://www.zhihu.com/people/your-user-name
  # 等等
```
2 设定链接的图标，对应的字段是 social_icons。其键值格式是 匹配键: Font Awesome 图标名称， 匹配键 与上一步所配置的链接的 显示文本 相同（大小写严格匹配），图标名称 是 Font Awesome 图标的名字（不必带 fa- 前缀）。 enable 选项用于控制是否显示图标，你可以设置成 false 来去掉图标。

```
# Social Icons
social_icons:
  enable: true
  # Icon Mappings
  GitHub: github
  Twitter: twitter
  微博: weibo
```

### 设置 RSS

NexT 中 RSS 有三个设置选项，满足特定的使用场景。 更改 主题配置文件，设定 rss 字段的值：

* false：禁用 RSS，不在页面上显示 RSS 连接。
* 留空：使用 Hexo 生成的 Feed 链接。 你可以需要先安装 hexo-generator-feed 插件。
* 具体的链接地址：适用于已经烧制过 Feed 的情形。

