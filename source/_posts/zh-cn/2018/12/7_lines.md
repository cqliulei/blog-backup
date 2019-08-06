---
title: 如何用Css 画N条不同的边线
date:  2018-12-25
tags: css
type: "categories"
categories: 前端开发 # 配置categories
comments: true
---


> 最近被同事问起，一个input如何画出7条不同的边线，当时头脑一阵懵B，搬着手一一数来：“border边框一条、outline一条” ，不就最多只有两条边线吗？（背景图片那些不算）… 

## 一、写在前面
尔后，想着是不是有什么奇淫技巧，突然眼前一亮，box-shadow这个属性应该能用到，不过怎么实现呐？【最后，在同事的提醒下，box-shadow居然可以有多重投影，真是css基础不扎实呀，为此搬好凳子，拿起本子做好笔记，以防以后忘记这些基础的东西，并且时时警示自己@_@！】

## 二、接下来看是如何实现的呢？
box-shadow属性可以为盒模型设定投影,但是其实它还有设定边框的功能。

#### 1.使用box-shadow 内投影实现多重边框

box-shadow正规语法

```css
none | [inset? && [ <offset-x> <offset-y> <blur-radius>? <spread-radius>? <color>? ] ]#
```
```css
    /* x偏移量 | y偏移量 | 阴影颜色 */
    box-shadow: 60px -16px teal;
    
    /* x偏移量 | y偏移量 | 阴影模糊半径 | 阴影颜色 */
    box-shadow: 10px 5px 5px black;
    
    /* x偏移量 | y偏移量 | 阴影模糊半径 | 阴影扩散半径 | 阴影颜色 */
    box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.2);
    
    /* 插页(阴影向内) | x偏移量 | y偏移量 | 阴影颜色 */
    box-shadow: inset 5em 1em gold;
    
    /* 任意数量的阴影，以逗号分隔 */
    box-shadow: 3px 3px red, -1em 0 0.4em olive;
    
    /* 全局关键字 */
    box-shadow: inherit;
    box-shadow: initial;
    box-shadow: unset;
```

box-shadow可以传递五个参数，第一个参数(none/inset)表示投影，第二个参数(offset-x/offset-y)表示偏移量，第三个参数(blur-radius)表示投影的模糊程度，第四个参数(spread-radius)表示投影的扩张度，最后一个参数(color)表示投影的颜色。【[具体参考MDN](https://developer.mozilla.org/zh-CN/docs/Web/CSS/box-shadow)】


然而我们平常很少用到第四个参数，在这里使用第四个参数，就可以让投影进行扩张，通过设定比较合适的值，就可以模拟出边框的效果了。

同样，box-shadow属性可以传入多个阴影的列表，用“,”分割即可。因此，只要我们定义一个阴影列表，并且递增的增加其扩张度参数的取值，就可以绘制出多重边框的效果了。

效果图:
![](http://qiniu.cqliulei.com/image/blog201812/2018-12-15-1.jpg)

html:
```html 
    <input type="text" class="input">
```
 

css代码:
```css
    .input {
        width:100px;
        height: 50px;
        margin:50px;
        border:1px solid #000;
         /*注意：向外扩张的距离要每次累加；内嵌投影即添加参数为inset,该参数可选，当不设置时即为外投影*/  
        box-shadow:0 0 0 1px red,0 0 0 2px blue,0 0 0 3px green,0 0 0 4px orange; 
    }

```

#### 2. 可以这样：(通过“,”分割,设置4边不同颜色)

css代码
```css
    box-shadow: 
       0px -2px 2px 0px #ff0000,   /*上边阴影  红色*/

       -2px 0px 2px 0px #3bee17,   /*左边阴影  绿色*/

       2px 0px 2px 0px #2279ee,    /*右边阴影  蓝色*/

       0px 2px 2px 0px #eede15;    /*下边阴影  黄色*/
```

效果
![](http://qiniu.cqliulei.com/image/blog201812/2018-12-15-6.png)


#### 3. 还可以这样^_^：（七彩虹圈）
html代码
```html
    <div class="rainbow">七彩虹圈</div>  
```

css代码
```css
    .rainbow{
        margin: 50px;
        width: 50px;
        height: 50px;
        border-radius: 50%;
        box-shadow:
        0 0 0 4px #F00,/*赤*/
        0 0 0 8px #F60,/*橙*/
        0 0 0 12px #FF0,/*黄*/
        0 0 0 16px #0C0,/*绿*/
        0 0 0 20px #699,/*青*/
        0 0 0 24px #06C,/*蓝*/
        0 0 0 28px #909;/*紫*/
    }
```

效果
![](http://qiniu.cqliulei.com/image/blog201812/2018-12-15-7.png)

优点：可以设置任意大小，任意多条边框

缺点：CSS3属性，无法兼容低版本浏览器，多重边框只能是实线

## 三、以下是CSS3实现多重边框的其他方法，仅供参考：

#### 1.div嵌套实现多重边框
这是最常规的方法，这里不做详细解释呈现。
效果图:
![](http://qiniu.cqliulei.com/image/blog201812/2018-12-15-2.jpg)


优点：border边框可以设置各种线型，比如虚线、实线。
缺点：可能无法修改结构或修改html结构成本高；多个div都设置圆角时，边框之间不能完全贴合。圆角多边框效果图：
![](http://qiniu.cqliulei.com/image/blog201812/2018-12-15-3.png)

#### 2.使用outline+outline-offset实现多重边框（只能实现两层边框）
如果我们只需要绘制两层边框，使用outline也可以做到。outline是border外面的一层，和border原理一样。通过设定outline的样式可以为border外面再设定一层边框。
效果图:
![](http://qiniu.cqliulei.com/image/blog201812/2018-12-15-4.jpg)

html代码
```html
    <div id="outline">outlie实现多重边框</div>  
```

css代码
```css
    #outline {   
        width: 84px;   
        height: 84px;   
        border: 8px solid blue;   
        /*-webkit-border-radius: 5px;  
        -moz-border-radius: 5px;  
        border-radius: 5px;*/  
        outline: 10px solid brown;   
        outline-offset: 0px;   
        /*border和outline之间的距离*/  
        margin: 20px;   
        /*因为outline不影响布局，使用margin给边框腾位置*/  
    }  
```

但是需要注意的是，outline属性设定的边框不会随着内部元素边界样式的变化而变化。也就是说，如果元素边框带了圆角，那么outline绘制出的最外层边框仍然是矩形的。这是outline绘制边框的一个缺憾。如下图：
![](http://qiniu.cqliulei.com/image/blog201812/2018-12-15-5.jpg)


优点：它跟边框类似，可以设置各种线型，比如虚线、实线。

缺点：outline不影响布局，需使用margin给边框腾位置。以防被其它元素覆盖。如果容器本身有圆角的话，描边并不能完全贴合圆角！


#### 3.使用box-shadow 内投影实现多重边框。(推荐使用)