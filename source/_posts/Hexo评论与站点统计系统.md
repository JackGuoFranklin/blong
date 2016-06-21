---
title: hexo评论系统与站点计数
tags: 
- hexo
- next
categories: hexo
---

评论系统与站点计数

添加 多说 或者 Disqus 第三方评论系统。当同时设置了 多说 和 Disqus 时，优先选择多说。

### 使用多说

1. 注册多说

	1. 登录后在首页选择 “我要安装”。

	2. 创建站点，填写站点相关信息。注意，多说域名 这一栏填写的即是你的 duoshuo_shortname。

2. 编辑站点的 _config.yml 注意，不是主题的_config.yml文件 ，添加 duoshuo_shortname 字段，设置如下

```
duoshuo_shortname: your-duoshuo-shortname
```
（注）duoshuo short name: 你的多说二级域名去掉 .duoshuo.com 部分

### 使用 Disqus
编辑站点的 _config.yml ，添加 disqus_shortname 字段，设置如下

```
disqus_shortname: your-disqus-shortname
```

### 多说评论显示 UA
需要配置 duoshuo_info 这个字段

```
duoshuo_info:
  ua_enable: true
  admin_enable: true
  user_id: 1234567
  admin_nickname: 主编大人
```
配置 user_id 和 admin_nickname 字段。 请访问 多说，登录并访问「我的主页」获取 user_id ， 此 ID 是 网址最后那串数字。

### 显示站点总访问量
找到站点的themes/next/layout/_partials目录下的footer.swig文件
将以下脚本和标签插入到文件中

```
	<script async src="https://dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js"></script>
	本站总访问量 <span id="busuanzi_value_site_pv"></span> &nbsp&nbsp&nbsp
	您是第<span id="busuanzi_value_site_uv"></span>个来到的小伙伴
```
插入到这里

```
	<div class="powered-by">
  	{{ __('footer.powered', '<a class="theme-link" href="http://hexo.io">Hexo</a>') }}
	</div>
	<div class="theme-info">
  	{{ __('footer.theme') }} -
 	 <a class="theme-link" href="https://github.com/iissnan/hexo-theme-next">
    NexT{% if theme.scheme %}.{{ theme.scheme }}{% endif %}
  	</a>
	</div>
	# 插入到这里
	{% block footer %}{% endblock %}
```
### 显示单页面访问量
修改themes/next/layout/_macro目录下的post.swig文件

位于文件开头,在第三个参数的位置，增加is_pv字段

```
{% macro render(post, is_index, is_pv, post_extra_class) %}
```
插入以下代码，用于区分文章页面跟首页

这里不用像”显示站点总访问量”中那样安装脚本，否则会出现重复计数的问题。

```
{% if is_pv %}
<span>&nbsp; | &nbsp;
<span id="busuanzi_value_page_pv" ></span>次阅读
</span>    
{% endif %}
```

插入这个位置

```
{% if post.comments %}
          {% if (theme.duoshuo and theme.duoshuo.shortname) or theme.duoshuo_shortname %}
            <span class="post-comments-count">
              &nbsp; | &nbsp;
              <a href="{{ url_for(post.path) }}#comments" itemprop="discussionUrl">
                <span class="post-comments-count ds-thread-count" data-thread-key="{{ post.path }}" itemprop="commentsCount"></span>
              </a>
            </span>
          {% elseif theme.disqus_shortname %}
            <span class="post-comments-count">
            &nbsp; | &nbsp;
            <a href="{{ url_for(post.path) }}#comments" itemprop="discussionUrl">
              <span class="post-comments-count disqus-comment-count" data-disqus-identifier="{{ post.path }}" itemprop="commentsCount"></span>
            </a>
          </span>
          {% endif %}      
        {% endif %} 
	#插入到这里
      </div>
    </header>
 ```
修改themes/next/layout目录下的post.swig文件
 
这个文件是文章的模板
 
找到以下代码，给render方法传入刚才第一步中设置的参数。

```
{% block content %}
  <div id="posts" class="posts-expand">
  	#render方法第二个参数is_index为是否为首页
  	#第三个参数is_pv为我们刚才设置的是否显示计数
    {{ post_template.render(page, false, true) }} 
    <div class="post-spread">
      {% if theme.jiathis %}
        {% include '_partials/share/jiathis.swig' %}
      {% elseif theme.duoshuo_shortname and theme.duoshuo_share %}
        {% include '_partials/share/duoshuo_share.swig' %}
      {% endif %}
    </div>
  </div>
{% endblock %}
```
修改themes/next/layout目录下的index.swig文件

这个文件是首页的模板

找到以下代码，给render方法传入刚才第一步中设置的参数。

```
{% block content %}
  <section id="posts" class="posts-expand">
    {% for post in page.posts %}
       #render方法第二个参数is_index为是否为首页
       #第三个参数is_pv为我们刚才设置的是否显示计数
      {{ post_template.render(post, true, false) }}
    {% endfor %}
  </section>
  {% include '_partials/pagination.swig' %}
{% endblock %}
```
至此，我们的站点计数功能就做好了