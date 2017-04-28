---
title: mac恢复允许“任何来源”的选项
tags: mac
categories: mac
---

恢复允许“任何来源”的选项

```
我们可以在终端中使用 spctl 命令来实现：

　　sudo spctl --master-disable
```

输入上述命令之后，我们可以发现，久违的“任何来源”回来了：

如果在系统偏好设置的“安全与隐私”中重新选中允许 App Store 和被认可的开发者 App，即重新打开 Gatekeeper 后，允许“任何来源”App 的选项会再次消失，可运行上述命令再次关闭 Gatekeeper。