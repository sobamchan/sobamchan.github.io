---
title: yuruhachi
updated: 2019-04-24 19:52
---
やとうとしてた
    [x]event2vec datasetの名前とかの整理
    [x]step1をv100で回す
    [x]ゆるはちスライド修正
    [x]e2vの評価方法に関して熟考する -> 具体的なやり方を決定する。

    []lrのschedulingの実装
    []Wをword2vecで学習したもので初期化するための方法を調べる　（誰かいい感じにやっていないか）



やった


できなかった
* lrのschedulingの実装
* Wをword2vecで学習したもので初期化するための方法を調べる　（誰かいい感じにやっていないか）


あした


その他


評価はe5の文を生成してそれのbleuで評価。
test dataに対してevent vecをどのように取得するのかは考える必要がある。
W fix -> D random
