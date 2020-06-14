---
title: "Backtranslation Papers"
updated: 2018-01-02T23:38:56+09:00
---

目的
==

最近、教師なし翻訳とかでよく使用されているback-translationだが、 直接翻訳に使用する以外ではどんな感じの研究があるかを知りたかったので、 あまり見つからなかったが論文いくつか読んだのでここにまとめておく。（随時更新）

<!--more-->

全体感
===

back-translateした結果をsource sentenceのparaphraseとして、paraphrase detectionとかgeneration に使用されるのが多かった。

論文s
===

[Iterative Back-Translation for Neural Machine Translation](https://aclanthology.coli.uni-saarland.de/papers/W18-2703/w18-2703)
-------------------------------------------------------------------------------------------------------------------------------

source to targetの機械翻訳機を学習するのだけど、まず先に手持ちのparallel corpusでtarget to sourceを学習し それを用いて、monolingual corpus (in source language)からparallel corpusを生成してparallel corpusを カサ増ししてデータセットに加えてしまおうというもの。

[Style Transfer Through Back-Translation](https://aclanthology.coli.uni-saarland.de/papers/P18-1080/p18-1080)
-------------------------------------------------------------------------------------------------------------

Style Transferを行う文生成器を学習するんだけど、生成器 (decoder)への入力をいきなり、文をそのまま入れるのではなくて 別学習のNMT modelを使用してsource -> target -> sourceと一度back-translateし、そのsourceをencodeしたものを 入れることで、意味情報を濃く、style情報が削られた状態にしている。 こうすることでstyleを変換しやすくしているらしい。

[Learning Paraphrastic Sentence Embeddings from Back-Translated Bitext](https://aclanthology.coli.uni-saarland.de/papers/D17-1026/d17-1026)
-------------------------------------------------------------------------------------------------------------------------------------------

paraphrase sentenceの生成をback-translationすることで生成する。

[Paraphrasing Revisited with Neural Machine Translation](http://aclweb.org/anthology/E17-1083)
----------------------------------------------------------------------------------------------

paraphraseを生成するモデルをNMTのframeworkでやっているのだが、 back-translationで生成すると翻訳例がone-to-oneでmappingすることはできない理由で、必ずしも意味を完全に捉えたparaphraseを生成することはできない。 なので、target sentenceを生成する際に一つではなく複数生成したり、target languageを複数用意することで、source sentenceのaspectをできるだけ捉えてから生成するようにしている。
