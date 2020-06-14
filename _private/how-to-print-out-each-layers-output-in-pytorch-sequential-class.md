---
title: "How to Print Out Each Layers Output in Pytorch Sequential Class"
date: 2018-01-01T23:33:54+09:00
draft: true
---
目的
==

PyTorchの`Sequential` classはシンプルなモデルを記述するときや、 引数でlayerの数を変更するときとかに実装が簡単なので強化学習のAgentの実装とかでよく使用する。  
しかし、`nn.Module`の時みたいにデータの流れを明示的に記述しないので、あるlayerの出力を表示したいときとかに若干困る。

<!--more-->

いい方法ないかと調べていた時にPyTorch Forumのサイトで単純だが簡単なやり方を見つけたのでメモしておく。

中身
==

`Sequential` classは以下のように、`nn.Module`で実装されているクラスを配列として受け取る。

layers \= \[\]
layers.append(nn.Linear(10, 2))
layers.append(nn.Linear(2, 10))
model \= nn.Sequential(\*layers)

`nn.Module`と`__init__()`, `forward()`を実装しておけば、 `nn.Linear`とかと同様に、`nn.Sequential`の1 layerとして登録できるので、 以下のようなclassをを用意しておけば良い。

class PrintLayer(nn.Module):

    def \_\_init\_\_(self):
        super(PrintLayer, self).\_\_init\_\_()

    def forward(self, x):
        print(x)
        return x

そしてこれを登録してやる。

layers \= \[\]
layers.append(nn.Linear(10, 2))
layers.append(PrintLayer())
layers.append(nn.Linear(2, 10))
model \= nn.Sequential(\*layers)

この例では第1層からの出力を表示してくれることになる。

感想
==

まあ当然のことなのだが休憩がてらメモした。

参考
==

[PyTorch Forum](https://discuss.pytorch.org/t/how-do-i-print-output-of-each-layer-in-sequential/5773)
