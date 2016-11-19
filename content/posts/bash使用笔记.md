+++
slug = ""
tags = [
  "",
  "",
]
title = "bash使用笔记"
date = "2016-11-05T11:11:42+08:00"

+++

## List
1. alias 不支持参数输入，可使用func替代
    ```
    xx() {
        echo $1
    }
    alias xx=xx
    ```
2. 将用户加到sudo组`sudo usermod -a -G sudo <username>`
3. kill -HUP <PID> 重启PID。经常使用的案例: 服务在docker中运行，需要在业务代码或者第三方库上面定位，`docker run -im docker-name bash`进入docker内部，修改代码之后，`kill -HUP 1`将重启docker，方便定位问题。
