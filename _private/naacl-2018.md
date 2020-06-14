---
title: "Naacl 2018"
date: 2020-03-16T23:31:58+09:00
draft: false
---
目的
==

[NAACL 2018](https://aclanthology.coli.uni-saarland.de/events/naacl-2018)の論文で自分の興味沿っているやつリストを消化したので、 面白かったものを10本選択して、ここにまとめる。  
基本的には[ここ](https://sobamchan.github.io/summaries/)に投稿しているものを選択して、 内容をコピーしただけ。

<!--more-->

背景
==

*   Totalで40本くらい読んだ。
*   対話、QA、翻訳、生成全般に興味があるのでそれに偏っている。
*   急いで読んだものも多いので、理解に間違いがある可能性あり。

中身
==

[Multi-Reward Reinforced Summarization with Saliency and Entailment](https://sobamchan.github.io/paper_summaries/Multi-Reward%20Reinforced%20Summarization%20with%20Saliency%20and%20Entailment/)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Abstractive summarizationにおいてpolicy gradientを使うことが増えてきた。  
この論文では、報酬関数にはROUGEが使用されることがほとんどだが、 本研究では新しい二つの報酬関数を作成提案した。 1. ROUGESal  
Keyword detecteを使用して、salientな情報に対して重みをつけたROUGE 2. Entail  
Entailment classifierを使用して、包含しているものに対して重みづけする

[Attentive Interaction Model: Modeling Changes in View in Argumentation](https://sobamchan.github.io/paper_summaries/Attentive%20Interaction%20Model:%20Modeling%20Changes%20in%20View%20in%20Argumentation/)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

redditの”change my view” forumっていう、スレッドの開始者が最初に述べた 意見に対して後続の参加者たちが、その意見を変えるためにいろんな意見を投稿するforumがある。  
この研究では、後続の意見がviewを変化させる事が出来たかを推定するモデルを、 最初の意見に対してのattentionや最初の意見と、後続の意見のinteractionをmodelingするネットワークで学習している。

[Improving Lexical Choice in Neural Machine Translation](https://sobamchan.github.io/paper_summaries/Improving%20Lexical%20Choice%20in%20Neural%20Machine%20Translation/)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

従来のenc-decでのNMTは出現頻度の少ないrare wordsの翻訳をうまくできていない。  
本研究では、従来の翻訳フレームワークの最後のoperationである、 hidden stateから単語idに対してmappingする式でのベクトル達のnormをconstant valueに固定してあげることで、row-resourceな言語間での翻訳も精度を保つことに成功した。

[Deep Generative Model for Joint Alignment and Word Representation](https://sobamchan.github.io/paper_summaries/Deep%20Generative%20Model%20for%20Joint%20Alignment%20and%20Word%20Representation/)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

word embeddingをtranslation datasetを使用して学習した。 その際に、

を仮定して、language 1のword embeddingをlanguage 2を使用して学習した

[Self-Training for Jointly Learning to Ask and Answer Questions](https://sobamchan.github.io/paper_summaries/Self-Training%20for%20Jointly%20Learning%20to%20Ask%20and%20Answer%20Questions/)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

QAタスクでの課題としてデータセットの作成がexpensiveであるというものがあり、これをunlabeled corpusを使用して改善する手法を提案している。  
labeled datasetでQA (Question answer) model, QG (Question generation) modelをまず学習する。 そのmodelsを使用して、unlabeled corpusからさらに、questionとanswerを生成し学習に役立てている。

[Combining Character and Word Information in Neural Machine Translation Using a Multi-Level Attentione](https://sobamchan.github.io/paper_summaries/Combining%20Character%20and%20Word%20Information%20in%20Neural%20Machine%20Translation%20Using%20a%20Multi-Level%20Attention/)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

従来の機械翻訳はword / sub-word / char levelから粒度を選択して使用する必要があった。  
本研究ではchar levelの情報をattentionを通して使用して(sub)word levelのencodingとdecodingに役立てるframeworkを提案している。

[Improving Neural Machine Translation with Conditional Sequence Generative Adversarial Nets](https://sobamchan.github.io/paper_summaries/Improving%20Neural%20Machine%20Translation%20with%20Conditional%20Sequence%20Generative%20Adversarial%20Nets/)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

二つの手法の合わせ技でNMTの精度向上を狙っている。  
GAN frameworkによる、教師データと生成されたデータをdiscriminatorに 判別されないように学習。 RLを使用して評価指標であるBLEUを直接最大化するように学習する。 最近はやりの両方のダブルパンチ。

[Dialog Generation Using Multi-turn Reasoning Neural Networks](https://sobamchan.github.io/paper_summaries/Dialog%20Generation%20Using%20Multi-turn%20Reasoning%20Neural%20Networks/)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

QA taskで最近よく使用されるような、memoryが拡張されているmodelを使用してqaでのdocumentを対話のcontextをして、  
queryをuser utteranceとして、memoryを参照して発話を生成することで、よりそれっぽくて、多様性のある発話を作ることができた。

[Knowledge-enriched Two-layered Attention Network for Sentiment Analysis](https://sobamchan.github.io/paper_summaries/Knowledge-enriched%20Two-layered%20Attention%20Network%20for%20Sentiment%20Analysis/)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

sentiment analysis taskにおいて二つのモデルのensembleで精度向上を狙った。 二つのモデルは、文章を入力として受け取るRNNと特徴量を入力として受け取るSVRを使用している。  
単語に対する情報をrichにするために、word netから作成したKnowledge Graph Embeddingを 特徴量としてSVRへの入力の一つとして使用している。

感想
==

QAはまあまあ追ってきたけど、なんかあんまり面白くないところに着地しつつあるかなって感じ。 QAやりたいって最初の方思ってたけど、なんか微妙。  
要約はここにのせたのも面白いし、乗せてなくても面白いものもあった。
