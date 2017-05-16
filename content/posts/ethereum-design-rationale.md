+++
title = "eth design rationale"
date = "2017-04-10T15:18:11+08:00"
tags = ["",""]
slug = ""

+++

## BTC 账户
比特币将数据存储在unspent transaction outputs中，整个系统的state由"unspent outputs"构成。
BTC系统的entire state（财产，财富，价值）由“unspent outputs(coins)”构成。每个coin拥有一个owner和一个value，每个笔交易将花费一些coins并且生成一些新的coins，规则如下：
交易的输入必须是valid and not yet spent
每笔交易必须有一个signature matching the owner of the input for every input
输入的value大于等于输出value的总和

用户账户的概念是：这个用户的私钥控制着的有效signature所对应的coins的total values。

## eth账户
eth的state存储在系统的账户里面，每个账户都有一个balance，也就是eth的特定数据结构。
一个交易是有效的，仅在发送方账户拥有足够的balance可以支付这次交易，如果接收方需要运行一些code，那么内部的internal storage需要被支付(charge)。

## 对比两种模型

## Merkle Patricia Trees

MPT被用来store eth所有的state。它具有一下特性：
* 对于root hash，每一个key/value是唯一的。
* 在log时间下完成内完成树的操作


## RPL
目的是把嵌套数组序列化成二进制数据。

一个区块包括header，交易列表和叔块列表。header
