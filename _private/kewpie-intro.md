---
title: "kewpie: KEyWord PIckEr with tf-idf"
date: 2020-03-17T09:08:29+09:00
draft: false
images:
  - /imgs/kewpie-intro-header.jpg 
tags:
  - nlp
---

{{< figure src="/imgs/kewpie-intro-header.jpg" alt="image" >}}

## tl;dr  

- tf-idfをscikit-learnから利用
- それをさらに抽象化しまくった[kewpie](https://github.com/tofunlp/kewpie)の紹介


<!--more-->


## 概要

自然言語を含んだデータの分析を行っていると，対象としている文書群，それぞれの特徴的な単語を抽出したいことが多々あります．
ここでの特徴的な単語とは，今見ているある文書をそれ以外の文書らと比較した際に，"際立つ" 単語のことを今回は指すことにします．

この目的を達成するために，自然言語処理分野では最も基本的なテクニックの一つに，[tf-idf](https://en.wikipedia.org/wiki/Tf%E2%80%93idf)がある．
これは，文書中のそれぞれの単語に対して単語の"特徴的度"を計算してくれます．
本記事は実装に関してのものなので，細かい説明は省きますが，ざっくりというと次の2点を満たす単語には高いスコアが付与されます．

1. 対象の文書中にたくさん出現しているか？
2. 対象の文書以外ではあまり出現していないか？

要約すると，tf-idfは「対象とする文書で特別多く出現する単語」を発見することのできる手法となっています．


## tf-idfの利用

tf-idf自体は，先に述べた要点からも分かるように，数え上げを基本とするので実装を一から自分でするのも簡単に行うことができます．
が，pythonの機械学習ライブラリのボスである[scikit-learn](https://scikit-learn.org/stable/)にすでに[実装されたもの](https://scikit-learn.org/stable/modules/generated/sklearn.feature_extraction.text.TfidfVectorizer.html#sklearn-feature-extraction-text-tfidfvectorizer)がありますので，
それを使うと，何も考えずに文書だけ用意すれば簡単にスコアを計算することができます．

### scikit-learnのインストール
```sh
pip install scikit-learn
```

### TfidfVectorizerの利用
```py
>>> from sklearn.feature_extraction.text import TfidfVectorizer
>>> corpus = [
...    "我々 は 宇宙人 だ ．",
...    "我々 は 野蛮人 だ ．",
...    "我々 は 海人 だ ．",
... ]
>>> vectorizer = TfidfVectorizer(token_pattern='(?u)\\b\\w+\\b')
>>> X = vectorizer.fit_transform(corpus)
>>> print(vectorizer.get_feature_names())
... ['だ', 'は', '宇宙人', '我々', '海人', '野蛮人']
>>> print(X.shape)
... (3, 6)
```

注意) `TfidfVectorizer`を利用する際に`token_pattern`を指定していないと，1文字からなるトークン (eg, は, だ) が消えます．  
これだけのコードで得られた`X`のなかに，`(corpus n, feature n)`分のtf-idfスコアが格納されています．
よって，これを`numpy`なりで大きい順にソートしてあげると，各corpusにおける特徴的な単語がわかります．

```py
>>> import numpy as np
>>> np.argsort(-1 * X.todense(), axis=1)
... matrix([[2, 0, 1, 3, 4, 5],  # -> ('宇宙人', 'だ', 'は', '我々', '海人', '野蛮人')
...         [5, 0, 1, 3, 2, 4],  # -> ( '野蛮人', 'だ', 'は', '我々', '宇宙人', '海人')
...         [4, 0, 1, 3, 2, 5]])  # -> ('海人', 'だ', 'は', '我々', '宇宙人', '野蛮人')
```

この`X.todense()`は`TfidfVectorizer`の出力はそのままではnumpyでソートできないので，できる形に変換していて，
最初に`-1`をかけているのは，そのままだと昇順なので，降順にしています．  

この例では`corpus`が小さく単語の種類も限られていますが，ちゃんと各文書のみで出現する単語が，リストの最初に来ていることがわかります．


## kewpie: KEyWord PIckEr with tf-idf
このように`TfidfVectorizer`を使えば，簡単に文書の特徴的な単語を発見することができるのですが，
僕自身，個人プロジェクト，研究やアルバイトであまりに多用するため，少し前から[pip installできる形でライブラリ化](https://github.com/tofunlp/kewpie)して使っています．  
ここでは，その使い方を少しだけ紹介します．

### インストール
```sh
>>> pip install kewpie
```

### kewpieの利用

```py
>>> from kewpie import KwPicker

>>> corpus = [
...    "我々 は 宇宙人 だ ．",
...    "我々 は 野蛮人 だ ．",
...    "我々 は 海人 だ ．",
... ]

>>> picker = KwPicker.build(corpus, savedir='/dir/to/save/model/')  # corpusを渡してBuild

>>> sentence = "我々 は 宇宙人 だ ．"  # 今回特徴単語を発見したい文
>>> span, keyword = picker.get_keyword(sentence)  # を渡すと，，，

>>> print(keyword)  # -> '宇宙人'  # 抽出される
```

コード量はそんなに変わりませんが，実装を間違えそうなソートの処理が隠蔽されて，文をそのまま渡せるAPIを生やしています．
また，`KwPicker.bulid`の際に，`savedir`を渡すと，tf-idf行列の計算をファイルに書き出して保存しておいてくれます．
小さな文書群の時は良いですが，大きくなると計算時間が少しかかるので，少し時間の節約になります．

以下のコードでロードしてまた使えます．

```py
>>> loaded_picker = KwPicker.load(savedir='/dir/you/saved/model')
```
