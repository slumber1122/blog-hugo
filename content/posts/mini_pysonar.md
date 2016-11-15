+++
title = "mini_pysonar"
date = "2016-11-13T11:42:12+08:00"
slug = ""
tags = [
  "mini_pysonar",
]

+++

一直动态语言的静态检查感兴趣。   
pysonar2的源码太多，一时间看不完，幸好王垠还写了一份tutorial的mini pysonar，可以用来学习。

## mini pysonar
mini_pysonar只有两个py文件，list.py是封装了lisp版本的list。对于py文件的静态检查的代码都在pysonar.py。作者也声明了这只是prototype，不过看完之后，还是收获很多，里面有很多parser的精巧设计。

## pysonar.py
同pysonar2一样，都是首先利用了python的ast库，通过`ast.parse(file.read())`获取文件的语法树。  
由于只是prototype，当前mini_pysonar仅能处理一些简单的py文件。import等语法还没有支持，list，tuple等结构的parse也被临时的注释了。我们可以从现有的代码学习一些parser的技巧和逻辑。   
处理ast返回的语法树的函数是`def infer(exp, env, stk)`函数。针对语法树中不同的对象做不同的处理。其中，对于list对象的推到，则要先去按照python 函数声明位置顺序无关的原则，先将函数压入栈中，然后递归下降推导list中的statements。推导statements的是`def inferSeq(exp, env, stk)`函数。两个函数的参数分别是ast中的语法对象->exp，exp的context->env，以及存放env的stack ->stk。其中env的数据结构是lisp的list构造的。对于inferSeq函数，目前仅考虑了exp是IF，Assign，FunctionDef，Return，Expr这些情况。当看到这些代码时，有种回到当年学习汇编语言的感觉，对于语句怎么执行，出现什么结果，他们之间的调用关系是什么，一目了然。

## python ast
之前，没有过多接触时觉得很神奇，后来稍微了解了一下，编辑器相关知识，就明白，python的整个语法是定义在[Python.asdl](https://github.com/python/cpython/blob/master/Parser/Python.asdl)之中。任何一份py文件，都可以通过`ast.parse()`语法树对象，这个对象也可以继续编译。
