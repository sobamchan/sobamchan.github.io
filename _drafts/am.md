---
title: Adapter Module
updated: 2020-11-13
---

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
仕組み自体は[これより前に CV 分野で提案](https://arxiv.org/abs/1705.08045)されていたが，NLP 分野で大成功を収めている BERT での活用は上記で初めてだった．
