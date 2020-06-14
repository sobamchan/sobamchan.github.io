---
title: "洋楽ラッパーの歌詞の分類問題をscrapyとscikit-learnを使ってやってみる"
date: 2017-01-29T09:22:28+09:00
draft: false
toc: false
images:
tags: 
  - scikit-learn
  - python
  - scrapy
---


[Qiitaのアカウント削除のために，移動してきました．]


ソースコードは[ここ](https://bitbucket.org/Sotaro/emimem_vs_snoopdogg)にあります。

先日機械学習ハンズオンでscikit-learnを用いた簡単なテキスト分類の手法を勉強したので、自分の好きなものに使ってみました。

やりたいこと

---

アメリカのラッパーで有名な[EMINEM](https://ja.wikipedia.org/wiki/エミネム)と[SNOOP DOGG](https://ja.wikipedia.org/wiki/スヌープ・ドッグ)の歌詞を判定するモデルをSVMを用いて作成したい。

手順

---

scrapyで歌詞サイトから各アーティストの歌詞データを取得する
scikit-learnのTfidfVectorizerでベクトル化する
scikit-learnのsvmで学習
評価

---

### 1) scrapyで歌詞サイトから各アーティストの歌詞データを取得する

今回は元データを[MetroLyrics](http://www.metrolyrics.com)の方から取得しました。

Qiitaの[この投稿](http://qiita.com/checkpoint/items/038b59b29df8e1e384a2)を参考に```metro_spider.py```を作り、```scrapy runspider metro_spider.py -o snoop_dogg.json```としてSNOOP DOGGの歌詞を全て持ってきました。

spiderクラスの実装でscrapyが便利だなと感じたのが、

```py
response.css('.songs-table tbody tr td > a::attr(href)')
```
とするだけで、html内のタグを指定でき、クロール対象となるリンクを取得できました。

クロール対象内では、

```py3

lyrics = []

for lyric in response.xpath('//p[@class="verse"]/text()'):

lyrics.append(lyric.extract())

```
とすることで複数のpタグにまたがっている歌詞データをまとめてから保存することができました。





### 2) scikit-learnのTfidfVectorizerでベクトル化する

次に先ほど生成されたeminem.jsonとsnoop_dogg.jsonのデータをscikit-learnのTfidfVectorizerでベクトル化していきます。

```py3

f = open('eminem.json', 'r')
json_data_eminem = json.load(f)
f.close()

```
でjsonを読み込んで、eminemの歌詞とsnoop doggの歌詞を一つのリスト(doc_list)に入れます。

```py3

vectorizer = TfidfVectorizer(min_df=1, max_df=50)
X = vectorizer.fit_transform(doc_list)

```
一行目でTfidVectorizerを用いたベクトル化のオブジェクトを作り、二行目で歌詞のリストをベクトル化してXに代入しています。

```py3

perm = np.random.permutation(X.shape[0])

train_index = perm[0:80]
test_index = perm[80:]

X_train = X[train_index,:]
y_train = y[train_index]
X_test = X[test_index,:]
y_test = y[test_index]

```
```np.random.permutation(X.shape[0])```は先ほど作成したXデータは前半の90データがeminem、後半の90データがsnoop doggとデータの順序が偏っているので、シャッフルしています。
それを8:1の割合で学習データとテストデータに分割しています。

### 3) scikit-learnのsvmで学習

```py3

from sklearn import svm

clf = svm.LinearSVC()
clf.fit(X_train, y_train)

```

[scikit-learn](http://scikit-learn.org/stable/)を使うと学習はこれだけみたいでした。便利。

### 4) 評価

```py

clf.score(X_test, y_test)

```
評価```score```関数を用いることで数値として見ることができました。

```bash

$ python scikit.py
0.8708

```
今回は9割程度の結果になりました。

[twitter始めました](https://twitter.com/sobamchan)
