---
title: "自然言語処理ライブラリ sister を使った，簡単な文ベクトルの作成方法 "
date: 2020-03-20T09:03:34+09:00
draft: false
toc: false
images:
  - /imgs/sister-intro-header.jpg
tags: 
  - nlp
  - sister
  - word-embedding
---

{{< figure src="/imgs/sister-intro-header.jpg" alt="image" >}}


## tl;dr

- 文埋め込みを簡単に作れる[pythonライブラリ](https://github.com/tofunlp/sister)の紹介


## 概要

推薦システムをはじめとして，アプリケーションへのデータ利用が盛んになってきた今，自然言語処理技術をアプリケーションに組み込みたいことは多々あります．

- Webメディアに「この記事に類似した他の記事」推薦機能
- 基本の文字列検索よりも，少し「賢い」検索機能
- ユーザーの投稿を見て，類似しているユーザーの列挙

少し考えただけでたくさん出てきます．  

一般に，このような仕組みを構築するには，自然言語データを計算機で扱いやすくするために数値表現に変換する必要があります．

この自然言語の数値表現方法は，現在たくさんの方法が提案されています．
その中でもMikolov大先生が2013年に提案したのを皮切りに激しく発展した， __単語ベクトル__ (or 単語埋め込み) をベースにした方法は，
多くのアプリケーションで稼働していることだと思います．

僕自身も多くの場面で，単語ベクトルを使って自然言語文の数値表現を獲得したいことが多々あるのですが，
公開されているモデルをダウンロードしてきて，さらにそのモデルをpythonに読み込むライブラリをインストールして，
文中の単語をそれぞれベクトルかして，最後に文の表現を作るためにさらに変換する．  
と小さなことですが，多くのステップを文の表現を獲得するまでに踏まなくてはいけません．

これを簡潔にするために，今回`pip`でインストールできて，数行のpythonコードで上記のステップを行ってくれるライブラリを書きましたので，それの紹介をしようと思います．


## [sister](https://github.com/tofunlp/sister) 使い方

まずコードを載せちゃいます．
`pip install sister`でインストールしてから


```python
>>> import sister

>>> sentence_embedding = sister.MeanEmbedding(lang="ja")

>>> sentence = "私はパリコレに出たことはありません．"
>>> vector = sentence_embedding(sentence)

>>> print(vector.shape)
... (300,)
```

実際のコードとしては4行で済んでいますね．

一行ずつ説明していきます．

```python
>>> senten_embedding = sister.MeanEmbedding(lang="ja")
```
この行では，
1. 初回実行時の場合にはモデルのダウンロード (デフォルトでは[fastText](https://github.com/facebookresearch/fastText/)です)
2. バイナリファイルをロード
をしています．

```python
>>> sentence = "私はパリコレに出たことはありません．"  # サンプルの文を定義しているだけ
>>> vector = sentence_embedding(sentence)
```
ここでは，
1. 文を形態素解析して，単語ごとに分割 ([Janome](https://mocobeta.github.io/janome/))
2. 各単語の単語ベクトルを取得
3. 単語ベクトルのリストを使って，文のベクトルを作成する．(単語ベクトルの各要素の平均をとる．)

{{< figure src="/imgs/sister-intro-swem-mean.png" alt="image" class="small" caption="単語ベクトルから文ベクトルへ変換" >}}

3.の単語ベクトルの羅列から文ベクトルを構成する方法は，
[Baseline Needs More Love: On Simple Word-Embedding-Based Models and Associated Pooling Mechanisms](https://arxiv.org/abs/1805.09843)を参考にした非常にシンプルな方法が実装されています．


本ライブラリ, [sister](https://github.com/tofunlp/sister)を使えば，単語ベクトルの取得，日本語の場合は分かち書きから，文への変換まで，
数行のコードで書くことができます．
次の記事では，このライブラリを利用して，実際に何かしらの機械学習を行ってみたいとおもっています．(本当にやるかはわからない．)


---

### 参考文献

- [Distributed Representations of Words and Phrases and their Compositionality](https://papers.nips.cc/paper/5021-distributed-representations-of-words-and-phrases-and-their-compositionality.pdf)
- [Efficient Estimation of Word Representations in Vector Space](https://arxiv.org/pdf/1301.3781.pdf)



---

### 関連記事
