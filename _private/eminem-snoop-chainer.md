---
title: "洋楽ラッパーの歌詞の分類問題をchainer使ってやってみる"
date: 2017-02-04T09:27:28+09:00
draft: false
toc: false
images:
tags: 
  - nlp
  - chainer
  - ml
---

[Qiitaのアカウント削除のために，移動してきました．]


ソースコードは[ここ](https://github.com/sobamchan/eminem_snoop_chainer)にあります。
[以前](http://qiita.com/sobamchan/items/24c3616aac81aa86f74d)同様の分類をscikit-learnを使用してやってみたことがあったので、今回はディープラーニングのフレームワークであるchainerを使用して、簡単なプログラムを書いて分類してみました。

(*) 今回はプログラムの正確さにあまり自信がないため、もし間違い等がありましたら、是非コメント等で教えていただけたらと思います。

使用するデータは前回と同様、[eminem](https://ja.wikipedia.org/wiki/%E3%82%A8%E3%83%9F%E3%83%8D%E3%83%A0)さんと[snoop dogg](https://ja.wikipedia.org/wiki/%E3%82%B9%E3%83%8C%E3%83%BC%E3%83%97%E3%83%BB%E3%83%89%E3%83%83%E3%82%B0)さんの歌詞を使用させてもらいました。

## 手順
1. 歌詞を数え上げにより作成された、出現回数のベクトルに変換する
2. データセットを訓練用と、テスト用に分割する
3. chainerで必要なものを初期化し
4. 学習サイクルを回して

## 1. 歌詞を数え上げにより作成された、出現回数のベクトルに変換する
この作業は前回にTfidfのベクトルをscikit-learnを使用して作成したのと同様に、scikit-learnに頼ってベクトル化します。

```py3
from sklearn.feature_extraction.text import CountVectorizer
vectorizer = CountVectorizer(lyrics)
```
これだけです！
lyricsには一つの歌詞を一つの要素としている配列が代入されています。
このvectorizerは後で使用します。

## 2. データセットを訓練用と、テスト用に分割する
ここでは以下の四つのデータを用意します
- x_train (学習に使用するデータ, 歌詞)
- t_train (学習データに対応する正解ラベル, eminem(0) か snoop(1)か)
- y_test (テスト時に使用するデータ, 歌詞)
- t_test (テスト時に使用するデータに対応する正解ラベル)

実際には以下のようにしています（効率が悪そうなやり方ですが、、、）

```py3
x_train = np.array(eminem_lyrics[:int(len(eminem_lyrics)*0.8)] + snoop_lyrics[:int(len(snoop_lyrics)*0.8)])
t_train = np.array([0] * int(len(eminem_lyrics)*0.8) + [1] * int(len(snoop_lyrics)*0.8)).astype(np.int32)
x_test = np.array(eminem_lyrics[-int(len(eminem_lyrics)*0.2):] + snoop_lyrics[-int(len(snoop_lyrics)*0.2):])
t_test = np.array([0] * int(len(eminem_lyrics)*0.2) + [1] * int(len(snoop_lyrics)*0.2)).astype(np.int32)
```

## 3. chainerで必要なものを初期化
chainerで定義したモデルと、chainer提供の最適化関数を初期化します。
```py3
model = MyChain()
optimizer = optimizers.SGD()
optimizer.setup(model)
```

## 4. 学習サイクルを回してみる
```py3
for j in tqdm(range(epoch)):
    sfindx = np.random.permutation(train_N)
    # train
    for i in range(0, train_N, bs):
        x_text = x_train[sfindx[i:i+bs]]
        x_vecs = vectorizer.transform(x_text).toarray()
        x_vecs = np.array(x_vecs).astype(np.float32)
        x = Variable(x_vecs)
        t = Variable(t_train[sfindx[i:i+bs]])
        model.cleargrads()
        loss = model(x, t)
        loss.backward()
        optimizer.update()
```
やっていることはnumpyのrandom.permutation()で配列からランダムに要素を取り出すためのいんでっくすを作成し、
先ほど定義しておいたvectorizerで歌詞をベクトルに変換した上で、
chainer.Variable()でchainerが受け付けてくれる形に変換し、
modelに渡してあげているだけです。

そのモデルは以下のように定義されています。

```py3
class MyChain(Chain):
    def __init__(self):
        super(MyChain, self).__init__(
            l1=L.Linear(None, 2),
        )
    def __call__(self, x, y, train=True):
        return F.softmax_cross_entropy(self.fwd(x, train=train), y)
    def fwd(self, x, train=True):
        return self.l1(x)
```

学習サイクルに関しては以上になります。詳しくはリポジトリの方を意味ていただきたいです。

## 結果
```
epoch = 15
batch size = 10
```
という、何も考えずに何となく設定して学習を回してみてテストデータで正答率を出してみたところ91.6%ほどになりました！

## 感想
chainerが本当に扱いやすく、深層学習ちょびっとだけしか勉強したことがない僕でも、一応何かしらの学習は行うことができる感じでした。
今回はとりあえずchainerで何かしらやってみたいってことで、何も考えずにとりあえずモデル等を定義しましたが、次回からはちゃんと目的を持ち、大きめのデータセットで学習をしてみたいなと思いました。
