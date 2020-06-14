---
title: multi labeled classification
updated: 2019-04-22 08:29
---

やとうとしてた
* DAAD申請のプランニング
* model.pyの実装
* 家賃入れ


やった


できなかった


あした


その他


model.pyの実装は完了したけど、
複数のeventを予測するためにはmulti-label classificationにする必要がある。
しかし、pytorch CrossEntropyLossはそれに対応していないため、
one-hot encodingをtargetに施してから、binary cross entropy loss functionを使う。


binary cross entropyだと、値の範囲が 0 to 1に入っている必要があったので、
MSELossにした。
これの実装は完了。
あとは全データで回してみるだけ。
gpu1上で実装していたが、いちおうlossの落ち続けている実験がGPUを専有しているので
他のmachineで実行できるようにしよう。
とりあえず疲れたので論文読む。




event2vecの実装をやっていた。
複数のラベルに対して同時に予測を行うような設計にしているので
現在の実装でいいのかはよくわからない。
