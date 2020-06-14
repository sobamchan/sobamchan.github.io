---
title: "Pytorch S2s Projects"
date: 2019-01-22T23:39:57+09:00
draft: false
---

目的
==

少し前からPytorchをベースとしたSeq2Seqのライブラリ？(or boilerplate的なもの)を作っているんだけど、 それの全体的な構成の参考のために類似プロジェクトを探しているのでリストとしてここにまとめておく。  
OpenNMTとか、allennlpは完成度は非常に高くていいのだが、ここではもう少し小さくて簡単に全体の見通しがたてれるものに絞る。 構造の参考にしたいだけなので、動作確認まではしていない。  
(随時更新)
<!--more-->

探し方
===

githubで"pytorch", "seq2seq"で検索して、スター件数上位である程度コードが構造化されているものたち。

上位からいくつか
========

*   [IBM/pytorch-seq2seq](https://github.com/IBM/pytorch-seq2seq)  
    半年前くらいから開発が止まってしまっているっぽいが、シンプルな実装で全体の見通しは良い。
*   [MaximumEntropy/Seq2Seq-PyTorch](https://github.com/MaximumEntropy/Seq2Seq-PyTorch)  
    これも二年前から開発が止まっているぽい。要約とかも実装してあるが、training loopとかがベタッとしている。
*   [eladhoffer/seq2seq.pytorch](https://github.com/eladhoffer/seq2seq.pytorch)  
    かなりいい感じ。同作者の他のutil repoを使用していたり、広大になっているが構造も実装もすごく参考になる。Transformerも実装されている。
*   [lium-lst/nmtpytorch](https://github.com/lium-lst/nmtpytorch)  
    pipでインストールしてコマンドラインから使用できる。
*   [keon/seq2se](https://github.com/keon/seq2seq)  
    train, model, utilsからなるかなりシンプルな実装
*   [outcastofmusic/quick-nlp](https://github.com/outcastofmusic/quick-nlp)  
    fast.ai inspiredな実装になっているらしい。Transformerもある。Dockerfileも置いてあっていきなり使えるようになっている。
