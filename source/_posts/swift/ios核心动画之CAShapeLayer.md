---
title: ios核心动画之CAShapeLayer
tags: 
- ios
- animation
categories: ios
---
### 专用图层
##### CAShapeLayer

CAShapeLayer优点：

1. 渲染快速。CAShapeLayer使用了硬件加速，绘制同一图形会比用Core Graphics快很多。
2. 高效使用内存。一个CAShapeLayer不需要像普通CALayer一样创建一个寄宿图形，所以无论有多大，都不会占用太多的内存。
3. 不会被图层边界剪裁掉。一个CAShapeLayer可以在边界之外绘制。你的图层路径不会像在使用Core Graphics的普通CALayer一样被剪裁掉（如我们在第二章所见）。
4. 不会出现像素化。当你给CAShapeLayer做3D变换时，它不像一个有寄宿图的普通图层一样变得像素化。

创建一个CGPath 一般使用 UIBezierPath 绘制路线。

CAShapeLayer 属性

* lineWith（线宽，用点表示单位）
* lineCap（线条结尾的样子）
* lineJoin（线条之间的结合点的样子）
* strokeColor(线条颜色)
* fillColor（填充颜色）
* path（路线）

