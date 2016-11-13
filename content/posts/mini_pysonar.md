+++
title = "阅读mini_pysonar"
date = "2016-11-13T11:42:12+08:00"
slug = ""
tags = [
  "mini_pysonar",
]

+++
## parse py file

    获取py文件的ast，单个文件在ast中以Module对象表示，
    在infer时首先pre-bind names to functions in sequences,
    对于每个FunctionDef初始化成Closure对象，然后 build association lists，
    这里的list使用了lisp中的car,cdr 构成的Pair对象。          

```
if IS(e, FunctionDef):
    c = Closure(e, None)
    env = ext(e.name, [c], env)
```
