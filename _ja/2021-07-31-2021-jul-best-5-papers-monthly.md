---
title: 2021/07 に読んだ面白かった論文 5 選
updated: 2021-07-31
---


2021/7 月に[ニュースレター](https://www.getrevue.co/profile/sobamchan)で紹介した 40 本の NLP 論文の中から特に面白かったものを 5 本ピックアップ

active learning の邪魔をするサンプルの分析、学術文献からの情報抽出、外部知識利用モデルの分析、レア言語処理の難しさの分析、ニューラルモデルと語順の関係性の分析、論文の 5 本

[[2107.02331] Mind Your Outliers! Investigating the Negative Impact of Outliers on Active Learning for Visual Question Answering](https://arxiv.org/abs/2107.02331?utm_campaign=%E6%AF%8E%E9%80%B1%20NLP%20%E8%AB%96%E6%96%87&utm_medium=email&utm_source=Revue%20newsletter)  
**解決しようとした問題:** active learning は topic classification や object recognition ではサンプル効率化をあげてくれるのに、visual question answering では性能の低下を招く。**提案している解決策:** 8 つの active learning 手法をサンプルごとに検証したところ、collective outliers なるサンプルがいることで性能が低下していることがわかった。これは、active learning 手法がモデルに学習するように提案するのだが、モデルが学習に失敗してしまうサンプルである。失敗する理由としては、画像中のテキストに関しての質問であったり、追加の知識を必要とする質問であることが挙げられている。

[Fact or Fiction: Verifying Scientific Claims - ACL Anthology](https://aclanthology.org/2020.emnlp-main.609/?utm_campaign=%E6%AF%8E%E9%80%B1%20NLP%20%E8%AB%96%E6%96%87&utm_medium=email&utm_source=Revue%20newsletter)  
**解決しようとした問題:** 科学の発展がめざましいため、一般人はもちろん科学者であってもその最新情報を追うことは難しい。**提案している解決策:** 科学に関連した主張に対して、それを支持・否定する文献をそれぞれ検索して提示。さらに文献中からその根拠となる部分を抽出する。タスクを定義してデータセットを作成した (SCIFACT) 。

[ERNIE-NLI: Analyzing the Impact of Domain-Specific External Knowledge on Enhanced Representations for NLI - ACL Anthology](https://aclanthology.org/2021.deelio-1.7/?utm_campaign=%E6%AF%8E%E9%80%B1%20NLP%20%E8%AB%96%E6%96%87&utm_medium=email&utm_source=Revue%20newsletter)  
**解決しようとした問題:** 外部知識を NLP task に活用する研究があるが、どのような条件の時にそれらが有効に作用するかよくわかっていない。**提案している解決策:** natural language inference (NLI) タスクに注目して、外部知識を利用するモデルに関してその動作を調べた。NLI は hypothesis と premise の 2 文を扱うわけだが、それぞれに関連した、外部の knowledge base から取得した知識がどう関連しているか (position or negative) がその予測を助けるかどうかにおいて重要なポイントになることを明かした。さらに、既存の外部知識を活用するモデルである ERNIE を NLI のために、利用する外部知識を表現する knowledge embeddings を学習することでそのタスクにおいて精度の向上を達成した。

[When Being Unseen from mBERT is just the Beginning: Handling New Languages With Multilingual Language Models - ACL Anthology](https://aclanthology.org/2021.naacl-main.38/?utm_campaign=%E6%AF%8E%E9%80%B1%20NLP%20%E8%AB%96%E6%96%87&utm_medium=email&utm_source=Revue%20newsletter)  
**解決しようとした問題:** mBERT は言語間の転移学習をうまくすることができるが、うまくいかない言語も多く存在する。それらに関しての分析は現状不足している。**提案している解決策:** 転移学習が困難だとされている言語を、さらに細かく、その難易度別に分類した。その結果、言語が利用する script が希少だと問題になることがわかった。その解決方法として transliterating (字訳) の有効性を調査した。

[[2101.00010] UnNatural Language Inference](https://arxiv.org/abs/2101.00010?utm_campaign=%E6%AF%8E%E9%80%B1%20NLP%20%E8%AB%96%E6%96%87&utm_medium=email&utm_source=Revue%20newsletter)  
**解決しようとした問題:** NLP models が syntaxをどれだけ理解しているかわかっていない。さまざまな既存研究がある程度理解している、としているが。**提案している解決策:** 本論文では、従来研究が「models がある程度構文を理解している」といっている提言に対して疑いを持ち調査した。構文の理解、を計測する方法はさまざま存在しているが、少なくとも語順はその重要な要素である、として、models がどれほど語順に対して sensitive であるかを実験的に調べた。「syntax を理解しているなら語順が入れ替わった入力に対しては、こう振る舞うべき」という仮定をいくつかおいて検証して行ったところ、BERT 系列のモデルはこれに従わず、著者らの定義の範囲では syntax をモデルは利用していないことがわかった。

