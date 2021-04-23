---
title: skorch で深層学習簡単テキスト分類．
updated: 2020-12-31
---

## tl;dr

テキスト分類も完結にかけて良い．


<br/>

---

<br/>

先日，[skorch](https://skorch.readthedocs.io/) を試してみる[記事](https://sotaro.io/ja/skorch-beginner)を書いた．
そこでは iris datasets を使って簡単な分類問題を PyTorch で実装した MLP モデルを使って解いてみた．
そこで十分 skorch の素晴らしさを知ることはできた．

これで試しとしては十分なのだが，自分の専門はあくまでテキスト処理なのでテキストも skorch で扱ってみたい．

しっかりとしたデータセットで大きめのモデルを学習してベンチマークとしてみたいが，今唯一アクセスできる PC (macbook air) のストレージがもはやないので，
今回もモデルは MLP にして，データは数件の適当な極性分類っぽいテキストを自分で書いて使ってみる (train, test) = (8, 4) samples．

skorch と PyTorch に関しての処理は[前回記事](https://sotaro.io/ja/skorch-beginner)と同様である．
ただ，今回のデータはテキストであるため，それを数値化するために前処理として tokenize して fastText を使って埋め込みをしている．
これらの処理には自分が作成している[ライブラリ](https://github.com/tofunlp/sister)を使用している．
BERT を含めたテキストの埋め込みを簡単に日本語でも利用できるようにしているので興味ある人はチェックしてもらいたい．

```py
import sister
sentence_embedding = sister.MeanEmbedding(lang="en")
vector = sentence_embedding("hello world")
```
これだけの処理で任意のテキストをベクトル化することができる．

今回はこのようにベクトルかしたテキストを MLP への入力として訓練している．
コード全体は以下のようになった．

```py
import numpy as np
from sklearn.model_selection import train_test_split
from torch import nn
import sister

from skorch import NeuralNetClassifier

# リソース問題があるのでテキトーなデータセットを錬成する
train_texts = [
        'heppy new year',
        'well done',
        'nice to meet you',
        'hate you',
        'go to hell',
        'get lost'
        ]
test_texts = [
        'i love you',
        'welcome back',
        'go away',
        'who cares'
        ]
train_y = np.array([0, 0, 0, 1, 1, 1]).astype(np.int64)
test_y = np.array([0, 0, 1, 1]).astype(np.int64)


# ここは普通に PyTorch
class MyModule(nn.Module):

    def __init__(self, num_units=10, nonlin=nn.ReLU()):
        super().__init__()

        self.dense0 = nn.Linear(300, num_units)
        self.nonlin = nonlin
        self.dropout = nn.Dropout(0.5)
        self.dense1 = nn.Linear(num_units, num_units)
        self.output = nn.Linear(num_units, 3)
        self.softmax = nn.Softmax(dim=-1)

    def forward(self, X):
        X = self.nonlin(self.dense0(X))
        X = self.dropout(X)
        X = self.nonlin(self.dense1(X))
        X = self.softmax(self.output(X))
        return X


# PyTorch モデルを skorch で wrap するよ
# モデルの定義と一緒に，学習に関連する指定をするよ
net = NeuralNetClassifier(
        MyModule,
        max_epochs=300,
        lr=0.1,
        iterator_train__shuffle=True,
        train_split=None
        )

# 各文をベクトル化する
sentence_embedding = sister.MeanEmbedding(lang="en")
train_x = np.array([sentence_embedding(text) for text in train_texts]).astype(np.float32)
test_x = np.array([sentence_embedding(text) for text in test_texts]).astype(np.float32)

# scikit-learn の素晴らしいインターフェイスだね
net.fit(train_x, train_y)

# 一応最終精度で学習できてるかみてみるよ
print(net.score(train_x, train_y))
print(net.score(test_x, test_y))
```

まあ iris dataset の時からほとんど変わらない．
これを PyTorch のみで書くのに比べてやっぱり完結にかけて良い．
