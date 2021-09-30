---
title: 自動要約研究で主に扱われているタスクまとめ
updated: 2021-09-30
---

今週から自動要約の論文を幾らか読んでいる。どんなタスクがあるか最初は知らなかったので今のところ見つけたものをまとめる。
まだ調べ始めたばっかりなので漏れているものもあるかもしれない。あったら連絡して教えてくれたら嬉しいです。


# 要約の作成方法による違い

## Abstractive summarization (抽象的要約)

入力された文書を要約するような短い文章を生成する。柔軟で圧縮率の高い要約を作成できるが、入力とは異なる内容を出力したり、文として意味をなさないものを出力したりする問題もある。


例
- [Text Summarization with Pretrained Encoders - ACL Anthology](https://aclanthology.org/D19-1387/)
- [Long-Span Summarization via Local Attention and Content Selection - ACL Anthology](https://aclanthology.org/2021.acl-long.470)


## Extractive summarization (抽出的要約)

入力された文書からそれを特に言い表す文をいくつかそのまま抽出する。あくまで入力された文をそのまま出力するので整合性は取りやすい、が、柔軟性が低いため圧縮率が低くなったりする。

例
- [Text Summarization with Pretrained Encoders - ACL Anthology](https://aclanthology.org/D19-1387/)


# 問題設定による違い

## Multi-document summarization

入力文書が 1 つ以上ある設定。文書群の中から重要な点をまとめて要約を作成する必要がある。その中にも、対象とする文書群をさらに大きなプールから探すところから始める設定のタスクもある。要約作成方法の違いにより、abstractive 、extractive それぞれにさらに分かれる。

さらにこの派生として、optinion summarization や dialogue (conversation) summarization ってのもある。前者は EC サイト等にたくさんあるある商品に関してのレビューをまとめるもの、後者は会議の議事録など複数発話からなる会話の内容をまとめるもの。

例
- [Bringing Structure into Summaries: a Faceted Summarization Dataset for Long Scientific Documents - ACL Anthology](https://aclanthology.org/2021.acl-short.137/)
- [Self-Supervised Multimodal Opinion Summarization - ACL Anthology](https://aclanthology.org/2021.acl-long.33/)

## Query-focused summarization

同じ文書（群）を要約しようと思っても、必要としている人の目的によって最終的に欲しい内容は異なる場合がある。この状態をタスクとして再現するために、データ内に 1. 入力文書（群）、2. 要約内容 に加えて、3. Query (クエリ) を追加する。つまり、同じ入力文書だったとしても、Query を参照すると出力が変化する。パーソナライズされた要約とも言える。

これに類似したもので、faceted summarization （facet: 面）なるものがある。ある文書に対して複数の切り口で要約を作成することを目的としたもの。

これらもまた、要約作成方法の違いにより、abstractive 、 extractive それぞれにさらに分かれる。

参考
- [Coarse-to-Fine Query Focused Multi-Document Summarization - ACL Anthology](https://aclanthology.org/2020.emnlp-main.296)
- [Generating Query Focused Summaries from Query-Free Resources - ACL Anthology](https://aclanthology.org/2021.acl-long.475/)

# その他

評価方法とか、使うデータとか、教師なしか、とかもあるけど要約特有なものはこれくらいかな。
