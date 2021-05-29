---
title: 2021/05 に読んだ面白かった論文 5 選
updated: 2021-05-29
---

論文の簡単なまとめを送信するニュースレターを開始して一ヶ月経った．今月紹介した論文から特に面白かったものを 5 本選んでみた．

[Is Supervised Syntactic Parsing Beneficial for Language Understanding Tasks? An Empirical Investigation - ACL Anthology](https://www.aclweb.org/anthology/2021.eacl-main.270/?utm_campaign=%E6%AF%8E%E9%80%B1%20NLP%20%E8%AB%96%E6%96%87&utm_medium=email&utm_source=Revue%20newsletter)  
**解決しようとした問題**: syntactic parsing の必要性が，事前学習型言語モデルの出現で怪しくなってきている．**提案している解決策** : transformer based のモデルを使って，言語モデルを利用したときに，semantic parsing における教師信号が役に立つのか実験的に調べた．結果として syntactic parsing による追加の情報は language understanding tasks に影響を少ししか与えないことがわかった．

[\[2104.06644\] Masked Language Modeling and the Distributional Hypothesis: Order Word Matters Pre-training for Little](https://arxiv.org/abs/2104.06644?utm_campaign=%E6%AF%8E%E9%80%B1%20NLP%20%E8%AB%96%E6%96%87&utm_medium=email&utm_source=Revue%20newsletter)  
**解決しようとした問題**: Masked Langauge Modeling (MLM) で事前学習されたモデル等が数々の downstream tasks で高性能を達成できている理由はまだよくわかっていない．**提案している解決策**: MLM で事前学習させるときに，語順をランダムに入れ替えてみたところ，学習されたモデルはほとんど通常学習したモデルと downstream tasks における性能で劣っていないことを示した．語順が重要なタスクであっても問題がなかった．この結果から，MLM models の成功は syntactic や semantic な NLP pipeline を学習しているのではなく，より高次な分散された統計を獲得し，fine-tuning によって downstream tasks に活用していることが示唆された．

[\[1901.10444\] No Training Required: Exploring Random Encoders for Sentence Classification](https://arxiv.org/abs/1901.10444?utm_campaign=%E6%AF%8E%E9%80%B1%20NLP%20%E8%AB%96%E6%96%87&utm_medium=email&utm_source=Revue%20newsletter)  
**解決しようとした問題:** word embedding から pooling とかを使って作成される sentence embedding と，個別で学習されて InferSent や SkipThough のような sentence embedding がどう異なるのかはよくわかっていない．後者がどれだけ優れているのかもわかっていない．**提案している解決策:** word embeddings を入力として，task-specific な分類 layer 以外は一切学習しない状態でどれだけ精度が出せるのか調べてみた．これを実現するために，1) bag of random embedding projections, 2) randomly initialized recurrent networks 3) echo state networks を提案している．結果として，しっかり学習されるモデルとほとんど性能が変わらない (数ポイント) ことを示した．この結果から実験をする際に気をつけるべき事項をいくつか提示している．

[We Need To Talk About Random Splits - ACL Anthology](https://www.aclweb.org/anthology/2021.eacl-main.156/?utm_campaign=%E6%AF%8E%E9%80%B1%20NLP%20%E8%AB%96%E6%96%87&utm_medium=email&utm_source=Revue%20newsletter)  
**解決しようとした問題:** 正確な評価をするためにさまざまなデータセット分割方法があるが，どれが良いのかいまいちよくわかっていない．**提案している解決策:** 調査してみたところ，random/standard splits は楽観的な評価結果を出してしまうことが実験的にわかった．biased splits を使って現実世界へのデプロイを再現する従来研究があるが，それは逆に偏ったテスト結果を出してしまう恐れがある．本論文ではベストな方法として，複数の biased splits を試すことを提案している．

[Language Models as Knowledge Bases: On Entity Representations, Storage Capacity, and Paraphrased Queries - ACL Anthology](https://www.aclweb.org/anthology/2021.eacl-main.153/?utm_campaign=%E6%AF%8E%E9%80%B1%20NLP%20%E8%AB%96%E6%96%87&utm_medium=email&utm_source=Revue%20newsletter)  
**解決しようとした問題**: 言語モデル (LM) を知識ベース (KB) として利用する研究が出てきているが “LM の vocab に含まれている 21k エンティティーに知識が限定される” 等の問題がある．これらの詳細を知るために 3 つの research question を掲げて，それに関する実験をしている．RQ 1. どうやったら 100 万を超えるエンティティーを保存できるか？ RQ 2. LMs に保存できる知識の容量はどれくらいか？ RQ3 LMs が保持している知識の robust 性は？ (ie. 質問文が少し変わっても正しく query できるか？) **提案している解決策**: 上記の問いに答えるための実験をいくつかしている．12 layers of size 768 サイズの transformers で 100 万の wikipedia relations triples を 95 % の精度で保持していることがわかった．さらに，query 文がある程度類似していれば，元の query 文から幾らか変更を加えても問題なく情報抽出できることがわかった．これは従来の KB ではできない検索方法で新たな可能性を含む結果．

---

下にこれらをもともと紹介していたニュースレターへのリンクを貼っておくのでぜひ購読を．

- [sobamchan - Issue #1](https://www.getrevue.co/profile/sobamchan/issues/sobamchan-issue-1-57214)
- [毎週 NLP 論文 - Issue #2](https://www.getrevue.co/profile/sobamchan/issues/nlp-issue-2-589826)
- [毎週 NLP 論文 - Issue #3](https://www.getrevue.co/profile/sobamchan/issues/nlp-issue-3-629104)
