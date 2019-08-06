---
title: 获取Photoshop投影样式的两种方式
date:  2019-01-22 21:47
tags: css
type: "categories"
categories: 前端开发 # 配置categories
comments: true
---


> 一直以来获取photoshop设计图投影的css,总是网上搜索自己去转换计算，没办法，谁叫自己老了，记性不好了呢？

所以，闲暇之余就自己写了个小工具，使用如下截图（[工具地址](https://cqliulei.com/tools/#/psshadow2cssshadow)）

使用：

![](http://qiniu.cqliulei.com/image/blog201901/2019-01-28-1.png)

![](http://qiniu.cqliulei.com/image/blog201901/2019-01-28-2.png)


效果：
![](http://qiniu.cqliulei.com/image/blog201901/2019-01-28-5.png)

还有一种PS只带方法，也很方便快捷:
![](http://qiniu.cqliulei.com/image/blog201901/2019-01-28-3.png)

鼠标放置图层上点击右键-复制css即可

![](http://qiniu.cqliulei.com/image/blog201901/2019-01-28-4.png)

不过，有一个小小的bug，复制出来的透明度，始终会有多多少少的问题，需要手动修改一下！【当不透明度为100%的时候，复制出来css 始终显示为0.004~】