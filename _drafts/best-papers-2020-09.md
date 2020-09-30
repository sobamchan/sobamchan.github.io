---
title: 2020/09 に読んで面白かった論文 best 5
updated: 2020-09-30
---

paperpile をみたところ，今月は 31 本の論文を読んでいたので，そこから 5 つ自分的に面白かったものを簡単に紹介しつつあげていく．
注意なのだが，2020/09 に投稿された論文ではなくて，2020/09 に自分が読んだ論文，であるので投稿自体はそれよりも前であるものもある (むしろそれがほとんど) ．

まずタイトルだけあげる．

- [Language Models as Knowledge Bases?](https://arxiv.org/abs/1909.01066) (19/09)
- [VisualCOMET: Reasoning about the Dynamic Context of a Still Image](https://arxiv.org/abs/2004.10796) (20/04)
- [AdapterFusion: Non-Destructive Task Composition for Transfer Learning](https://arxiv.org/abs/2005.00247) (20/05)
- [Masking as an Efficient Alternative to Finetuning for Pretrained Language Models](https://arxiv.org/abs/2004.12406) (20/04)
- [Don't Stop Pretraining: Adapt Language Models to Domains and Tasks](https://arxiv.org/abs/2004.10964) (20/04)

[VisualCOMET](https://arxiv.org/abs/2004.10796) をのぞいて，他の論文は全部，事前学習型言語モデルに関してのものになっていた．
特に意識していなかったが，転移学習とか知識獲得系の論文に目がひかれがちなのでこうなるのは納得である．

一つずつめっちゃ簡単に紹介してみる．

---

### [Language Models as Knowledge Bases?](https://arxiv.org/abs/1909.01066) (19/09)
BERT が fine-tuning なしでも，Knowledge-Base にアクセスできる従来のモデルより，relational knowledge を保持していることを示した．
(Dante, born-in, X) → Florence みたいな知識を獲得できているので，Knowledge Base になりうるんじゃね？と．

### [VisualCOMET: Reasoning about the Dynamic Context of a Still Image](https://arxiv.org/abs/2004.10796) (20/04)
vision と commonsense を絡めたデータセット． 6 万のシーン (画像) の before, after, beyond に関して言語でアノテーションしてある．
溺れている人の画像には，"助けを待ちたかった"，"死を感じる"，"これから叫ぶ" とかが付いている．

### [AdapterFusion: Non-Destructive Task Composition for Transfer Learning](https://arxiv.org/abs/2005.00247) (20/05)
最近流行の adapter modules を複数タスクごとに学習して，それらを融合して推論をおこなう手法を提案．
別のタスクから得た知識を効率的に再活用することができていると主張している．

### [Masking as an Efficient Alternative to Finetuning for Pretrained Language Models](https://arxiv.org/abs/2004.12406) (20/04)
### [Don't Stop Pretraining: Adapt Language Models to Domains and Tasks](https://arxiv.org/abs/2004.10964) (20/04)
