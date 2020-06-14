---
title: "文ベクトル作成ライブラリsisterを使った，簡単な日本語テキスト分類"
date: 2020-03-21T08:20:15+09:00
draft: false
toc: false
images:
  - /imgs/sister-ja-text-classification-header.jpg
tags: 
  - nlp
  - sister
  - word-embedding
  - classification
---

{{< figure src="/imgs/sister-ja-text-classification-header.jpg" alt="image" >}}

## tl;dr

- 文ベクトルを使って簡単に日本語テキスト分類
- Web記事のタイトルを2値分類 -> 正答率90%


## 概要

[前回の記事](https://sobamchan.github.io/posts/sister-intro/)では，文を入力したら，単語ベクトルを利用して文の数値表現を作成してくれるライブラリの紹介をしました．
実質4行くらいのpythonで文ベクトルを得ることができました．  

文ベクトルを使ってできることはたくさんあるのですが，本記事ではその中でも特に一般的な，テキスト分類を行ってみようと思います．


## データセットの用意

今回は，[livedoor ニュースコーパス](https://www.rondhuit.com/download.html)を利用させてもらいます．
このデータセットは，複数メディアから収集された記事がたくさん格納されているのですが，今回は，その中でも二つ (「ITライフハック」，「独女通信」) に絞り，
さらに記事全体ではなく，タイトルだけを利用しようと思います．

つまり，今回行いたいのは，あるネット記事のタイトルが入力された時に，それが「ITライフハック」と「独女通信」のどちらに属するか判定するモデルを構築します．

[GitHub Gist](https://gist.github.com/sobamchan/1bb50c23de0e9b72eadfe60a9ae520a8#file-sister-ja-text-classification-build-dataset-py)にデータセットのダウンロードから，
今回のフォーマットに変換してcsv形式で保存するpython scriptをおいておきましたので，実際に実行したい方は参照してください．
これを実行すると，`text`と`label`をカラムとして持つcsvファイルが作成されます．

```csv
text,label
Ultrabookをパワーアップ！　mSATA対応の小型SSDがマイクロンより登場,0
コレでたばこを辞めました。独女の禁煙ヒストリー,1
```

データセットの一部を見てみると，こんな感じになっています．(label 0 -> ITライフハック，label 1 -> 独女通信)


## 分類器の作成

ここから，実際の分類器の作成に入っていきます．まず全体を下に貼り付けました．改行含んでも30行以下に収まります．

{{< gist sobamchan 1bb50c23de0e9b72eadfe60a9ae520a8 "sister-ja-text-classification-main.py" >}}

各ブロックごとに解説していきます．

```python
import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC

import sister
```

まず，今回使うライブラリをインポートします．`numpy`と`pandas`はデータ読み出し関連で使っています．
モデルには，今回，[scikit-learn](https://scikit-learn.org/)に実装されている[SVC](https://scikit-learn.org/stable/modules/generated/sklearn.svm.SVC.html#sklearn.svm.SVC)を利用します．
ここではモデルの詳細は飛ばしますが，分類タスクに強いモデルです．
最後に，文をベクトルに変換してくれる[`sister`](https://github.com/tofunlp/sister)を読み込みます．


次に，`main`関数の中を見ていきます．
```python
dataset = pd.read_csv("./dataset.csv")
texts, labels = zip(*dataset[["text", "label"]].values.tolist())

train_texts, test_texts, train_labels, test_labels =\
    train_test_split(texts, labels, stratify=labels)
```
関数内，最初のブロックは，先ほど作成したデータセットを読み込んで， 訓練用と評価用に分割しています．


で，非常に短いですが，本丸です．
```python
train_x = np.array([sentence_embedding(t) for t in train_texts])
test_x = np.array([sentence_embedding(t) for t in test_texts])

clf = SVC(kernel="linear")
clf.fit(train_x, train_labels)
```
最初の二行で，sisterを利用して文を一つずつベクトルに変換しています．
ここの詳しい説明は，[前回の投稿](https://sobamchan.github.io/posts/sister-intro/)を参照してください．
そして，訓練用，評価用の文らのベクトルを獲得してからは，scikit-learnのSVCモデルを訓練しています ．


で，最後に評価用データで正答率を求めています，
```python
print(clf.score(test_x, test_labels))
```
データの分割の際に乱数の固定をしていないので，結果は実行のたびに変わりますが，90%は超えてくれると思います．


### 参考文献

- [sklearn.svm.SVC](https://scikit-learn.org/stable/modules/generated/sklearn.svm.SVC.html#sklearn.svm.SVC)

### 関連記事
