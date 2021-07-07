---
title: 2021/06 に読んだ面白かった論文 5 選
updated: 2021-06-30
---

2021/6 月に[ニュースレター](https://www.getrevue.co/profile/sobamchan)で紹介した 39 本の NLP 論文の中から特に面白かったものを 5 本ピックアップ

[It’s Not Just Size That Matters: Small Language Models Are Also Few-Shot Learners - ACL Anthology](https://aclanthology.org/2021.naacl-main.185/?utm_campaign=%E6%AF%8E%E9%80%B1%20NLP%20%E8%AB%96%E6%96%87&utm_medium=email&utm_source=Revue%20newsletter)  
**解決しようとした問題:** GPT-3 は非常に少ない教師データで SuperGLUE 等で高い性能を達成しているが，モデルが非常に巨大なためその運用には現実的ではない場面が多い．**提案している解決策**: PET (Pattern-Exploiting Training) をベースに，multi-mask に対応させることで，ALBERT をベースとした，GPT-3 の 0.1% 分のパラメーターしかないモデルで，同等の性能を同じ設定で達成することができた．

[Towards Interpreting and Mitigating Shortcut Learning Behavior of NLU models - ACL Anthology](https://aclanthology.org/2021.naacl-main.71/?utm_campaign=%E6%AF%8E%E9%80%B1%20NLP%20%E8%AB%96%E6%96%87&utm_medium=email&utm_source=Revue%20newsletter)  
**解決しようとした問題**: いくつかの実験により自然言語理解のためのモデルが，データ中のバイアスを利用して，特徴のショートカットを活用するように学習してしまい，ちゃんとした理解をしていないことが示唆されている．**提案している解決策**: モデルがショートカットを利用してしまっている状態を測定する方法を提案し，それを利用し，利用している際には過剰に自信のある推論結果は出さないようにする新しいモデルを提案した．結果として，OOD (out of distribution) データに対して性能の向上を確認した．

[UniDrop: A Simple yet Effective Technique to Improve Transformer without Extra Cost - ACL Anthology](https://aclanthology.org/2021.naacl-main.302/?utm_campaign=%E6%AF%8E%E9%80%B1%20NLP%20%E8%AB%96%E6%96%87&utm_medium=email&utm_source=Revue%20newsletter)  
**解決しようとした問題**: 事前学習型言語モデルの over-parameterization による overfitting が問題。**提案している解決策**: Dropout に注目して、現在よく使われる、3 つの粒度 (feature dropout, structure dropout, data dropout) を統合した UniDrop を提案。IWSLT14 の翻訳で 1.5 BLEU、分類でも精度の向上を達成した。

[A Dataset of Information-Seeking Questions and Answers Anchored in Research Papers - ACL Anthology](https://aclanthology.org/2021.naacl-main.365/?utm_campaign=%E6%AF%8E%E9%80%B1%20NLP%20%E8%AB%96%E6%96%87&utm_medium=email&utm_source=Revue%20newsletter)  
**解決しようとした問題**: 研究者が論文を読む行為はたくさん時間を必要とする。その効率化がしたい。これは QA task として考えることができるが、既存のデータセットは簡単な推論を必要とするものしか存在しない。**提案している解決策**: 実際の NLP 論文をベースにデータセットを作成した。最初のアノテーターグループはタイトルとアブストを読んで論文に対しての質問を書き、他のアノテーターグループはそれに対しての回答を、エビデンスとなる論文中の箇所とともに記述する、というデータセットを作成。1500 の論文対して、5000 質問のサイズ。既存の QA models では十分な結果は出なかった。

[TuringAdvice: A Generative and Dynamic Evaluation of Language Use - ACL Anthology](https://www.aclweb.org/anthology/2021.naacl-main.386/?utm_campaign=%E6%AF%8E%E9%80%B1%20NLP%20%E8%AB%96%E6%96%87&utm_medium=email&utm_source=Revue%20newsletter)  
**解決しようとした問題**: 選択式のデータセットが多いが、現実世界では正しい回答が存在する場合は少ない。まだ、良い出力は他とのコミュニケーションの中で銅的に変化していくべき。**提案している解決策**: reddit をベースとして、困りごとに関しての質問に対しての助言を生成するタスクを提案。学生が解剖の授業に対して抱いている嫌悪感に関しての質問など、非常に現実的なサンプルが含まれている。また、評価システムが、結果提出時の reddit スレッドを参照するため、動的に最適な回答が変化するようになっている。T5 や GPT-3 等で取り組んでみたところほぼ全く解けなかった。

top 5 には入らなかったが面白かった 2 本。

[Multi-Adversarial Learning for Cross-Lingual Word Embeddings - ACL Anthology](https://aclanthology.org/2021.naacl-main.39/?utm_campaign=%E6%AF%8E%E9%80%B1%20NLP%20%E8%AB%96%E6%96%87&utm_medium=email&utm_source=Revue%20newsletter)  
**解決しようとした問題**: GAN を使って，cross-lingual word embedding (CLWE) を教師なしで学習する際には，両言語の word embedding space が同型であることを前提としている．が，これは正しくなく，特に類似していない言語間では正しくないことが知られている．**提案している解決策**: 同型でないのなら，単一の mapping で CLWE を表現することはできないので，複数の mapping を GAN の framework で学習する方法を提案した．  

[Parameter-efficient Multi-task Fine-tuning for Transformers via Shared Hypernetworks](https://www.idiap.ch/~rkarimi/papers/multitask_hypernet.pdf)  
**解決しようとした問題**: 効率的な fine-tuning は現状，レイヤー間に adapter modules を挿入することで実現している．が，これらの modules はタスクごとに学習されるため，タスク間で知見の共有をすることができたい．**提案している解決策**: 各タスクに対する Adapter module のためのパラメータをタスクを横断する　hypernetwork から生成することによってタスク間の情報共有を実現。


今後も毎週更新していく予定なのでぜひ[購読を](https://www.getrevue.co/profile/sobamchan)
