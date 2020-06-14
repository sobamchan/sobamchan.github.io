---
title: "scikit-learnのTfidfVectorizerを日本語に使うときの注意"
date: 2018-01-01T21:51:46+09:00
draft: false
---


[scikit-learnのTfidfVectorizer](https://scikit-learn.org/stable/modules/generated/sklearn.feature_extraction.text.TfidfVectorizer.html)


はものすごく便利で、分類とか類似度計算とかを数行で実装することができる。  
インターフェイスもシンプルなので、これまでもいくつかのプロジェクトで使用してきたが、結構大きな罠が日本語に対して適応するときにあるのにこの前気づいた。  
何も考えずに使用するとこんな感じで書ける。

<!--more-->


```py
from sklearn.feature_extraction.text import TfidfVectorizer

corpus = ['I like a dog .', 'I am a dog .', 'She was a cat before .']

vectorizer = TfidfVectorizer()
vectorizer.fit(corpus)
```

ただここで、文章をベクトル化する際に変換の対象になっているvectorizerのattributeであるvocabulary_を確認すると、

```json
{"am": 0, "cat": 1, "dog": 2, "like": 3, "she": 4, "was": 5}
```

がとなっていて、'I'や'a'は特徴として使用されないことがわかる。

最初これに遭遇したときに、TfidfVectorizerの引数であるmax_df等のせいかと思ったがdefaultで1.0なのでそんなこともなくて、 何でだろうかと思っていた。

するとTfidfVectorizerにはtoken_patternという引数もあり、それにはdefaultで`’(?u)\b\w\w+\b’`が渡されている。 Vectorizerがtokenとして認識する文字列の正規表現を指定しているのだが、このままだと文字数が2以上じゃないと認識されない。

なのでこれを`'(?u)\\b\\w+\\b'`にしてあげる必要がある。

つまりこう

```py
from sklearn.feature_extraction.text import TfidfVectorizer

corpus = ['I like a dog .', 'I am a dog .', 'She was a cat before .']

vectorizer = TfidfVectorizer(token_pattern='(?u)\\b\\w+\\b')
vectorizer.fit(corpus)
```

こうするとvocabulary_が

```json
{"a": 0, "am": 1, "cat": 2, "dog": 3, "I": 4, "like": 5, "she": 6, "was": 7}
```

になる。

英語を扱っている場合は、一文字の単語は意味のあまりないものが多いが、日本語の場合は漢字があるので結構危ない。 (象、 猿とか)
