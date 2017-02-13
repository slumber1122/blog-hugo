+++
date = "2017-02-13T22:55:55+08:00"
title = "python curses使用笔记"
tags = ["",""]
slug = ""

+++

在终端做一些app，可以用curses库。  
在开发命令行单词量测试时用到的一些问题总结一下：  
* 终端支持中文：在文件内导入
```
import locale
locale.setlocale(locale.LC_ALL,"")
screen.addstr(1,0, "".encode("utf-8"))
```
* 终端clear：`screen.clear()`
* 终端捕获输入时`ch = screen.getch()`，获取的是ascii值，判断比较时需要判断`ch == ord('q')`

具体还有什么一些高端用法，可以查看文档。
