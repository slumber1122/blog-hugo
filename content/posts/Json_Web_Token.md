+++
title = "Json Web Token"
date = "2016-11-23T20:49:29+08:00"
slug = ""
tags = [
  "JWT",
  "Token Generator",
]

+++

### Json Web Token

[JSON Web Token (JWT)](https://tools.ietf.org/html/rfc7519) 是一种基于 token 的认证方案.

通过JWT，我们可以进行在Web间安全的传递一些非敏感的信息。比如用户的user_id，用户的一些添加订单的操作。之所以被称为可靠，是因为通过JWT传递过来的payload的内容稍微一变化，服务器端就会发现。这里面具体用到了简单的密钥公钥算法，通过在网络之间传递公钥和payload，在服务器端利用私钥进行数据安全校验。一旦payload被篡改，校验就不一致，此数据请求就可以丢弃。

关于JWT的详细说明可以参见[WIKI](https://en.wikipedia.org/wiki/JSON_Web_Token)

### 简单的数据传送实现
可以利用JWT的这种策略完成一些我们对于非敏感信息的安全传送。发送数据时，附上公钥，在接收端利用secret key进行校验。简单的实现在gist中：    
{{< gist slumber1122 4baf6f83e11e78252f990f392a82d3d7 "__init__.py" >}}实现了签名的Generator  
{{< gist slumber1122 4baf6f83e11e78252f990f392a82d3d7 "md5.py" >}}实现了md5的校验  
{{< gist slumber1122 4baf6f83e11e78252f990f392a82d3d7 "rsa.py" >}}则实现了rsa的校验；最后展示了example  
{{< gist slumber1122 4baf6f83e11e78252f990f392a82d3d7 "example.py" >}}
