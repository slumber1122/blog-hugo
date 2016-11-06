+++
tags = [
  "Python",
  "Structure Python Project",
]
title = "开始一个Python项目"
date = "2016-11-06T18:17:33+08:00"
slug = ""

+++

### 项目结构
开始一个python project，首先注意命名的一些小细节,，需要遵循**common sense**：

* 项目名全小写
* 单词之间使用下划线或者什么都不使用(不要使用连字符)
* 上传pypi需要保证名字唯一

项目初始目录结构，举个栗子：
```
consistent_hash
├── consistent_hash
│   ├── __init__.py
│   └── ring.py
├── LICENSE
├── MANIFEST.in
├── README.md
├── requirements.txt
├── setup.py
└── tests
    ├── string_keys.txt
    └── test_ring.py

```
关于项目目录的详细说明可以参考[Structure of the Repository](http://docs.python-guide.org/en/latest/writing/structure/#structure-of-the-repository)

### setup.py
setup.py是为了项目的打包分发，你可以本地安装`pip install .`，   
也可以创建一个分发包`python setup.py sdist`，  
这样`dist/consistent_hash-0.1.tar.gz`在你项目的顶层目录。   
如果需要上传到pypi，执行`python setup.py register sdist upload`，   
详细的list可以`python setup.py --help-commands`。   
对于项目中的一些Non-Code的文件，e.g. 图片/文件，如果需要打进包里，可以使用MANIFEST.in文件的机制，栗子：
```
include docs/*.md
include consistent_hash/data.json
```
并且在setup()函数中，需要设置`include_package_data=True`。

### 项目测试
目前最好的方式进行项目测试就是[Nose](https://nose.readthedocs.io/en/latest/)。  
在项目顶层目录执行`nosetests`，就可以执行项目的测试用例。   
如果项目在github上，也可以使用[Travis CI](https://travis-ci.org/)进行持续集成测试，具体可以参见[Building a Python Project](https://docs.travis-ci.com/user/languages/python/)。   

### Python_Project_Generator
写了一个Python项目生成器，可以一键生成一个python项目，[python_project_generator](https://github.com/slumber1122/python_project_generator)
