+++
tags = [
  "hugo",
  "github pages",
]
title = "Hugo搭建Github Pages静态网站"
date = "2016-10-29T12:17:00+08:00"
slug = ""

+++
### 安装Hugo创建初始网站
安装hugo`$ brew update && brew install hugo`   
创建自己的站点`$ hugo new site mysite`   
会生成以下目录
```
content/
static/
themes/
config.toml
```
config.toml是网站的配置文件，一个TOML文件，全称是Tom’s Obvious, Minimal Language，这是它的作者GitHub联合创始人Tom Preston-Werner 觉得YAML不够优雅，捣鼓出来的一个新格式。如果你不喜欢这种格式，你可以将config.toml替换为YAML格式的config.yaml，或者json格式的config.json。hugo都支持。   
进行个人配置
```
baseurl = "http://slumber1122.github.io"
title = "長風無時"
languageCode = "en-us"
theme = "hugo-zen"
author = "wade van"
copyright = "wade van All rights reserved."

[params]
  logo      = "/images/me.jpg"
```

### 安装Theme

进入 mysite `$ cd mysite`在[gohugo](http://themes.gohugo.io/)选择一个皮肤,   
安装皮肤`$ git submodule add https://github.com/spf13/hyde themes/hyde`   

### 新建文章

content目录里放的是你写的markdown文章，layouts目录里放的是网站的模板文件，static目录里放的是一些图片、css、js等资源。

创建一个about页面`$ hugo new about.md`
如果是博客日志，最好将md文件放在content的post目录里。   
`$ hugo new post/first.md`
执行完后，会在content/post目录自动生成一个MarkDown格式的first.md文件   
```
+++
tags = [
  "hugo",
  "github pages",
]
title = "Hugo搭建Github Pages静态网站"
date = "2016-10-29T12:17:00+08:00"
slug = ""

+++
hello
```
用markdown进行创作。

在命令行执行，`hugo server -w`， 可以在浏览器中访问` http://127.0.0.1:1313/hugo_blog/`进行预览

### 关联至Github的个人页面
* 建立 <github-project>-hugo repo (用來 host Hugo 的內容)
* 建立 <your-github-account>.github.io repo (个人静态网站)

将hugo repo link到刚才创建的hugo站点目录
```
$ git init
$ git remote add git@githut.com/slumber1122/<github-project>-hugo.git
```
将个人静态网站link到public目录下
```
$ rm -rf public
$ git submodule add git@github.com:<your-github-account>/<your-github-account>.github.io.git public
```

### 发布blog
```
# deploy.sh
#!/bin/bash
echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
# Build the project.
hugo # if using a theme, replace by `hugo -t <yourtheme>`
# Go To Public folder
cd public
# Add changes to git.
git add -A
# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"
# Push source and build repos.
git push origin master
# Come Back
cd ..

git add -A
msg="backup blog site `date`"
git commit -m "$msg"
git push origin master
```
将deploy.sh新增至站点目录下，执行`$ ./deploy.sh "you commit message"`便可将內容推送到 <your-github-account>-hugo，而 public被推送到 <your-github-account>.github.io上。

### 站点目录结构
```
├── LICENSE
├── README.md
├── config.toml
├── content
│   └── posts
│       ├── Structuring_Python_Project.md
│       ├── first-post.md
│       └── neural_net.md
├── deploy.sh
├── posthelper.sh
├── public
├── static
│   └── images
│       └── me.jpg
└── themes
    └── hugo-zen
```

### 参考资料
[在 Github Pages 建立 Hugo 靜態網站](http://kaichu.io/2015/07/12/my-first-post/)
