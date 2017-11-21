---
title: hexo 问题集合
tags: 
- hexo
categories: hexo
---

hexo 问题集合

hexo 问题集合

1，hexo 升级问题

Node 旧版本升级到新版本后, Hexo 命令执行失败. node_modules 缓存问题

```
Error: The module '/Users/guojunbing23/gitresource/blong/node_modules/hexo/node_modules/hexo-log/node_modules/bunyan/node_modules/dtrace-provider/build/Release/DTraceProviderBindings.node'
was compiled against a different Node.js version using
NODE_MODULE_VERSION 46. This version of Node.js requires
NODE_MODULE_VERSION 51. Please try re-compiling or re-installing
the module (for instance, using npm rebuild ornpm install).
```
解决方法

```
cd into your hexo-project

rm -rvf node_modules
npm install
```
解决办法:[https://github.com/hexojs/hexo/issues/2534] (https://github.com/hexojs/hexo/issues/2534)