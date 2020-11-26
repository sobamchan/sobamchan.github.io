---
title: Adapter Module
updated: 2020-11-13
---

- 背景
- メリット
- 技術詳細
- 応用例

多くの自然言語処理タスクで高性能を出している deep learning モデルだが，その成功には大規模な訓練用データセットが必要になる．
しかし多くのプロジェクトではコストの問題でそのようなデータセットを構築するのは困難である．
そこで近年 BERT をはじめとしたモデルで注目を集めている転移学習 (Transfer Learning) にたどり着く．
転移学習では入手可能な大規模なデータセットでモデルを学習させることで初期化し (pre-training) ，「温まった」状態で本来の目的であるがサイズは小さいデータセットで再学習 (fine-tuning) することで，
データが少量であったとしても高い性能を出すことを目的としたフレームワークである．
例として [BERT](https://arxiv.org/abs/1810.04805) では，[Transformer](https://arxiv.org/abs/1706.03762) をベースとした巨大モデルを，
まず教師データが不要な方法 (Masked Language Modeling & Next Sentence Prediction) で初期化し，その後で各種 NLP タスクに対して再学習している．
このように pre-training を経ることで，大規模な言語リソースを利用して自然言語の統計的情報を獲得し，それを興味のタスクに流用することで高い性能を達成できる．

この転移学習をさらに一歩進める機構を提案した手法を本記事では取り上げて，それを利用した他の研究もいくつか紹介する．
その手法とは，[Parameter-Efficient Transfer Learning for NLP](https://arxiv.org/abs/1902.00751) で BERT への応用が提案された Adapter Modules である．
仕組み自体は[これより前に CV 分野で提案](https://arxiv.org/abs/1705.08045)されていたが，BERT での活用は上記で初めてだった．

[この論文](https://arxiv.org/abs/1902.00751) で設定されている問題は，前述の転移学習のものとは少し異なり，様々なタスクがシステムに流れてくる．
基本の転移学習システムでは，pre-training されたモデルをあるタスク (ex. テキスト感情分類) に対して fine-tuning したらそれ以降，別のタスク (ex. 質問応答) に応用されることはない．
つまり，2 つの異なるタスクに対応したかったら，pre-training したモデルを 2 つに複製して，それぞれ別のタスクに fine-tuning する必要がある．
本論文ではこの制約が，クラウドサービス等で機械学習機能を提供する際にメモリ等の圧迫につながる問題となるとしている．
確かに，最近よく使われる BERT 等のモデルは非常にサイズが大きいため，単一のサーバーでいくつもメモリに載せておくこと，さらにはストレージに保存しておくことさえも問題となるケースは考えられる．

この問題を解決するために，Adapter Modules が提案された．
どんなものかはあとで詳細に説明するが，概要としては，N 個のタスクに対応するために BERT 全体を N 個複製するのではなく，Adapter Modules と呼ばれる小さなパラメーターブロックのみを
タスクごとに用意することで，パラメーター効率よく転移学習ができるというもの．
結果として，通常通り BERT 全体を N 個複製した時と比較して，性能はほとんど変わらずに pre-training された BERT の 3 % ほどのパラメーターを足すだけで済んだとのこと．

---

# Adapter Modules

Adapter Modules (以後 AM) がどんなものなのか説明する．(画像は[元論文](https://arxiv.org/abs/1902.00751)から)
AM は pre-trained BERT の各 transformer block の中に 2 つ挿入される．場所は 1. multi-headed attention レイヤー からの projection の後と 2. 二つの feed forward の後 になる．

<p align="center">
  <img src="https://lh3.googleusercontent.com/pw/ACtC-3fk_wCRAzDcWFzoaxHCku57Qq2lShx-esHtFChjH-TLPHmGti05NiSPYsu2DutnSIP9JddDU3Yu8qsZRm6Ccc97twDRJZ4qj8lucUuutIdPTSQCKo0mD0ZSO2fy0zxMa0ufFhHU_14PM3IBPBgAHRbKDg=w283-h404-no?authuser=0" />
</p>

<!-- アーキテクチャデザイン -->
AM の中身はシンプルな bottole neck アーキテクチャになっている．
<p align="center">
  <img src="https://lh3.googleusercontent.com/pw/ACtC-3ephogUzrCIN4i4Ib8t-wWUfAf-WdFzkaJ0evPDwSZ-CNAlkZWJ4S41gnT4IRKaD5Al0b6bOZbC5doS2fEO42sEgR-CsOsDCuS2glG0gKmC-UHHaTk3ifau42itxrWkfYqTUSju40h6WiyVBM0a1qrv_g=w283-h383-no?authuser=0" />
</p>
論文中では他にもいくつかのパターン，複雑なものも含めて，試して見たいだが精度比較したところこの割とシンプルな構造が一番良かったのとのこと．

<!-- 初期化の仕方 -->
pre-trained BERT の内部に後から新しいパラメーターを持つブロックを挿入しているので，このままでは BERT が事前に獲得していた言語統計量が失われてしまう．
そこで，AM 挿入後にこれのらパラメーターを挿入前の BERT の出力に近くなるように初期化している (near-identify initialization)．
正直これをすることで，BERT が事前に獲得していた知識を復元することができるのかはわからないが，実験的にこれが安定した学習に必要だったとのころ．

<!-- 利用方法 -->
AM の初期化が済んだところで，学習のフェーズに入る．
従来の fine-tuning では，対象のタスクに対して BERT 全体のパラメータを更新しつつ学習するのだが AM を使う場合には，
新規に挿入した AM のパラメータのにを更新する．
また，別のタスクにモデルを fine-tune したい時には，BERT 全体を別に用意するのではなくて，新しい AM を用意しそれを最初に挿入した AM と差し替えて 1. 初期化 (near-identify initialization) をして 2. AM のみ更新する fine-tunine をすれば良い．
これは，fine-tuning の際に BERT 自身のパラメーターは更新せず AM のみを更新の対象とするため可能になる．

<!-- 実験内容 -->
これの性能を評価するために論文中では GLUE とその他いくつかのテキスト分類データセットで評価している．
詳細は省略するが，GLUE では 9 つのタスクがあるため従来のタスクでは BERT を 9 つ複製して fine-tuning するため BERT * 9 分のパラメータが必要とされていたが，
AM を利用すれば BERT * 1.3 分だけのパラメータ量で済んだとのこと．
そして必要なパラメーターを大幅に下げても，精度的には 80.4 → 80.0 の減少で済んでいる．

AM を BERT に応用した論文が投稿されたのは 2019/Jan だがすでに応用・改良した論文がいくつか存在するのでそれらを簡単に紹介していく．

- AdapterFusion: Non-Destructive Task Composition for Transfer Learning
  複数のタスクのためにそれぞれ AM を用意して fine-tuning するのだが，他のタスクの知見も利用することができるように，AdapterFusion モジュールを用意した．
  あるタスクの推論を行うときに，他タスクの AM からの情報も混ぜ合わせて利用する．
- K-ADAPTER: Infusing Knowledge into Pre-Trained Models with Adapters
  AM を使って，pre-trained RoBERTa にさらなる factural knowledge を注入している．新しい知識には大規模コーパスから自動生成された，一般知識的なものと言語知識を利用した．
  評価には一般知識を問うデータセットを用いて，結果として精度の向上を確認．
  RoBERTa の pre-trained 時の知識を破壊することなく，continual に外部知識を注入することができたとのこと．
- MAD-X: An Adapter-based Framework for Multi-task Cross-lingual Transfer
  多言語 BERT 
