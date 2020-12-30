---
title: PyTorch を scikit-learn 化する skorch を試してみる．
updated: 2020-12-30
---

## tl;dr

簡単な分類をするくらいならコード量が減るので使った方がいい．


## 内容

- skorch とは
- できそうなこと
- iris 分類してみる
- まとめ


## skorch とは
[公式ドキュメント](https://skorch.readthedocs.io/en/latest/?badge=latest)を見てみると以下のようにまず説明がある．

> A scikit-learn compatible neural network library that wraps PyTorch.

PyTorch で実装したモデルをラップする関数等を提供するライブラリのようである
さらにそのラップされた PyTorch モデルは scikit-learn のインターフェイスを持つとのこと．

そして，このライブラリを使うにあたって，scikit-learn と PyTorch の使い方を知っている人であれば，ライブラリに特化した新しいことを学ぶ必要がないとのこと．
これは自分みたいに研究で PyTorch を使ったことがあって，バイトでは scikit-learn でモデルを作っていたのだが，深層学習モデルも試してみたい人にぴったりである．
scikit-learn でも一応 [Multi Layer Perceptron](https://scikit-learn.org/stable/modules/generated/sklearn.neural_network.MLPClassifier.html) は簡単に使えたのだが，
細かい設定はやはりできないし，CNN とか RNN とかのモデルを使うことはできない．
さらに，PyTorch を使えるということは，研究者とか実装を公開している最新のモデルを簡単に使えるようになるってことなのでそれも魅力的である．


## できそうなこと

研究以外で深層学習モデルを使いたいときにやりたいことは，モデルに関しては研究時の時のものよりシンプルなことが多い．
「大そうな SotA なモデルをカチカチにチューニングしたい」なんてことはなくて，「SVM で十分だけど深層学習も一応試しておきたい」くらいな感じ．
そもそも，自作のサービスとかで ML モデルを使うときに深層学習を使うほどリソースを計算に裂けない．
多くの非メガ IT 企業のプロダクトでもそんな感じなのではないだろうか．

こんな用途の時に skorch は活躍しそうである．というか，scikit-learn compatible にしてくれることでそれ以上の成果を出してくれるだろう．

ドキュメントを見ると，[scikit-learn の pipeline](https://scikit-learn.org/stable/modules/generated/sklearn.pipeline.Pipeline.html) に組み込むための[もの](https://skorch.readthedocs.io/en/latest/user/quickstart.html#in-an-sklearn-pipeline) や
Grid Search を行うための[インターフェイス](https://skorch.readthedocs.io/en/latest/user/quickstart.html#grid-search)が用意されているようである．
どちらも仕事でいくつかのモデルを差し替えながら試す時に多用する scikit-learn の機能であるのでこのライフサイクルにのせることができるのは非常に便利．

あとモデルの保存に関してのユーティリティーもある．
依存関係の解決でエラーが出ることがあるので，PyTorch のモデルをそのまま [pickle](https://docs.python.org/3/library/pickle.html) で保存するのは避けたい，
そのための便利関数も [skorch は提供してくれている](https://skorch.readthedocs.io/en/latest/?badge=latest)．
これを使うことでモデルを丸ごと保存するのではなく，必要なパラメーターだけ保存してくれるみたいである．
pickle を何も考えずに使ってよくエラーに遭遇する身としては非常にありがたい機能．  
また，callback 関数を設定することで学習の途中でも必要な条件でモデルを保存させることもできそう．
簡単な実験では必要ではないかもしれないがあると嬉しい．

自分は使わなそうだが，学習済みモデルを [REST API として提供するための関数](https://skorch.readthedocs.io/en/latest/user/REST.html)も用意されているみたい．

まとめてみると，モデルは Pure PyTorch で実装することになるので，そこの自由度は無限大である．
が，学習の仕組み（データの渡し方，モデルの更新の仕方）でちょっと変わったことをしようとするとめんどくさくなりそうである．
しかし，多くの実務ではそんな要件は発生しないであろう．
そう考えると，SVM を試した後に実験的に深層学習モデルも試してみたいことがある自分のようなケースには完璧なツールになりそう．
ちょっと試したいだけの時に training loop を書いたりするのは本質できではないし重複処理なので書くのがめんどくさい．

類似したツールで自分が知っているものに [PyTorch Lightning](https://github.com/PyTorchLightning/pytorch-lightning) がある．
これと比較すると，PyTorch Lightning の方が自由度が効く分実装が必要な部分が多くなりそう．
このことからも多くの実務実装では skorch の方が適しているのではないだろうか．


## iris で分類してみる
だらだらと書くのはこれまでにして実際に動かしてみる．
とりあえずデータセットへのアクセスが簡単な [iris dataset](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.load_iris.html#sklearn.datasets.load_iris) で試してみる．
モデルはとりあえず [nn.Linear](https://pytorch.org/docs/stable/generated/torch.nn.Linear.html) をただ積んだだけのものにしちゃう．
自然言語処理モデルも試したいがそれは次の記事に任せてみる．

[公式 README のサンプル](https://github.com/skorch-dev/skorch) をベースに iris dataset で分類器を学習する．
データ周りを少しだけ変えて，ダミーデータではなくて iris を使うようにする．

```py
import numpy as np
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from torch import nn

from skorch import NeuralNetClassifier

# iris のデータを読み込むよ
dataset = load_iris()
X, y = dataset.data, dataset.target
# 一応分割してみるよ
train_x, test_x, train_y, test_y = train_test_split(X, y)
train_x = train_x.astype(np.float32)
test_x = test_x.astype(np.float32)
train_y = train_y.astype(np.int64)
test_y = test_y.astype(np.int64)


# ここは普通に PyTorch
class MyModule(nn.Module):

    def __init__(self, num_units=10, nonlin=nn.ReLU()):
        super().__init__()

        self.dense0 = nn.Linear(4, num_units)
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
        iterator_train__shuffle=True
        )

# scikit-learn の素晴らしいインターフェイスだね
net.fit(train_x, train_y)

# 一応最終精度で学習できてるかみてみるよ
# 両方 9 割超えた
print(net.score(train_x, train_y))
print(net.score(test_x, test_y))
```

売り文句としてあるように，完全な pure PyTorch モデルを一つのクラスでラップするだけで `.fit` とか `.score` 関数が生えるのは便利．
さらにモデルの定義に関して関与は一切してこないので本当に追加の学習コストが発生しない．


## まとめ
宣伝文句のように PyTorch を知っていれば簡単に使えた．
いくか提供されている[サンプル](https://skorch.readthedocs.io/en/latest/user/tutorials.html)を見た感じ，少し複雑な学習をしたかったら面倒なことになりそう．
そんな時には，PyTorch Lightning を使うのだ良いのだろう．
が，実験的に深層学習モデルを試してみたい時には必要記述数を下げてくれるので，これから第一選択肢と使っていくだろう．
