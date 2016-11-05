+++
date = "2016-11-05T11:07:50+08:00"
slug = ""
tags = [
  "git",
]
title = "git使用笔记"

+++

## List

- ubuntu中，git add 提交文件名是中文时,  
如果出现形如334\443\848\221.md的乱码。可以使用如下解决方式：
```
git config --global core.quotepath false
```

- git submodules  
添加子模块`git submodule add https://github.com/spf13/hyde themes/hyde`  
子模块代码的操作，只需要在子模块文件夹内操作
