---
title: gensim - lda
updated: 2021-02-08
---

日本語の場合には分かち書きが必要になるが，[gensim](https://radimrehurek.com/gensim/) を使えば [LDA](https://radimrehurek.com/gensim/models/ldamodel.html) によるトピックモデルを簡単に構築することができる．トピックモデルを使えば，ラベリングを行うことなく，大量のテキストをなんとなくグループに分割し，さらに各グループをうまく表すような単語を抽出することができる．

gensim をつかって LDA のモデルを作るのは以下の流れになる

1. `List[List[str]]` から gensim 辞書を構築する
2. 1 の辞書から訓練用テキストデータの単語を id で置換する
3. 2 でベクトル化されたテキストデータから LDA を学習する

これでモデルを作成してからは，好きなテキストデータを辞書でベクトル化すれば，そのトピック単語を推定することができる．

```py
from gensim.corpora.dictionary import Dictionary
from gensim.models.ldamodel import LdaModel


texts = [["soccer", "baseball"], ["computer", "keybaord"], ["tree", "flower"]]
common_dict = Dictionary(texts)
common_corpus = [common_dict.doc2bow[t] for t in texts]

lda = LdaModel(
     common_corpus,
     num_topics=10,
     id2word=common_dict,
     random_state=1
     )

# 入力ドキュメントのトピック単語を推定
target_doc = ["tennis", "ball"]
lda.get_document_topics(common_dict.doc2bow[target_doc])
```

参考
- https://qiita.com/Spooky_Maskman/items/0d03ea499b88abf56819
- https://ohke.hateblo.jp/entry/2017/11/14/230000
