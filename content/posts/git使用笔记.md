+++
date = "2016-11-05T11:07:50+08:00"
slug = ""
tags = [
  "git",
]
title = "git使用笔记"

+++

## FAQ

- ubuntu中，git add 提交文件名是中文时，如果出现形如334\443\848\221.md的乱码。可以使用如下解决方式：`git config --global core.quotepath false`
- git submodules     
添加子模块`git submodule add https://github.com/spf13/hyde themes/hyde`子模块代码的操作，只需要在子模块文件夹内操作。  
对于新人拉项目代码时，在pull主项目之后，submodule的获取可以通过`git submodule init`，然后`git submodule update`;更快的命令是`git clone --recursive /path/to/repos/foo.git`
- 针对github已经配置了公钥，仍然Permission denied     
   最快的解决办法时，重新生成一个专门用于github账户的id_rsa，放置到`~/.ssh/id_rsa_github`，然后添加到ssh-add中。
- 多账号管理：一般配置github或者gitlab时，通常都会`git config --global user.name "slumber1122"`，这样子所有的项目的提交name都是这个user，如果你有多个账号（公司内部的gitlab和github）这样提交必然会将log乱掉，github上面的每天贡献是根据自己的username和email显示的，乱掉之后，就不会贴瓷片了。解决办法：

    ```
    ssh-keygen -t rsa -C "mywork@email.com"  # 新建工作的SSH key
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa_work # 将其添加到ssh agent中
    vi ~/.ssh/config

    # config file
    Host github.com
        HostName github.com
        User  git
        IdentityFile ~/.ssh/id_rsa_github

    Host github2 # 别名
        HostName github.com
        User git
        IdentityFile ~/.ssh/id_rsa_work
    ```
