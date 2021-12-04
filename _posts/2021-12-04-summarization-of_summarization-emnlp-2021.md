---
title: A Summarization of Summarization Papers from EMNLP 2021
updated: 2021-12-02
---

<a href="https://imgur.com/aWLcmz6"><img src="https://i.imgur.com/aWLcmz6.jpg" title="source: imgur.com" /></a>  
Garbage can close to my house, has nothing to do with NLP.

# Introduction

I started my Ph.D. two month ago, with some literature study and discussion, I decided to focus on "Text Summarization". While its phrase, "Text Summarization", sounds simple and straightforward, I had no idea what researchers are actually working on. So I decided to (skim-)read (almost) all papers in fresh EMNLP 2021 about summarization, and tried to understand its overview.  
At the end, I read 42 papers from main (long/short), finding (long/short), workshop about summarization. However, I didn't read ones about "Dialogue/Conversation summarization" and some language specific papers. It's not that they aren't interesting but simply I didn't have time/energy.
To show a clear view of what researchers are working on, I tried to spot keywords and categorize. There are 18 keywords (some of them have only one paper), for each keyword, I listed related papers from the conference. And at the end of this post, I listed papers with short summaries so you can decide which papers you want to read.


# Keywords

I here list 18 keywords with their short description, and related papers. Ordered by the number of related papers.

- New dataset/task (7 papers)
  Papers propose new dataset or task. In deep learning era, we need a lot of annotated data, some papers here constracted very large datasets.
  - [Decision-Focused Summarization](https://aclanthology.org/2021.emnlp-main.10/)
  - [MSˆ2: Multi-Document Summarization of Medical Studies](https://aclanthology.org/2021.emnlp-main.594/)
  - [MassiveSumm: a very large-scale, very multilingual, news summarisation dataset](https://aclanthology.org/2021.emnlp-main.797/)
  - [MiRANews: Dataset and Benchmarks for Multi-Resource-Assisted News Summarization](https://aclanthology.org/2021.findings-emnlp.133)
  - [TLDR9+: A Large Scale Resource for Extreme Summarization of Social Media Posts](https://aclanthology.org/2021.newsum-1.15)
  - [SUBSUME: A Dataset for Subjective Summary Extraction from Wikipedia Documents](https://aclanthology.org/2021.newsum-1.14)
  - [A Novel Wikipedia based Dataset for Monolingual and Cross-Lingual Summarization](https://aclanthology.org/2021.newsum-1.5)
- Evaluation (5 papers)
  While we have ROUGE or BERTScore, they are know not to correlate well with human evaluations so we need better evaluation framework.
  - [Finding a Balanced Degree of Automation for Summary Evaluation](https://aclanthology.org/2021.emnlp-main.531/)
  - [QuestEval: Summarization Asks for Fact-based Evaluation](https://aclanthology.org/2021.emnlp-main.529/)
  - [Fine-grained Factual Consistency Assessment for Abstractive Summarization Models](https://aclanthology.org/2021.emnlp-main.9/)
  - [Gradient-based Adversarial Factual Consistency Evaluation for Abstractive Summarization](https://aclanthology.org/2021.emnlp-main.337)
  - [Are Factuality Checkers Reliable? Adversarial Meta-evaluation of Factuality in Summarization](https://aclanthology.org/2021.findings-emnlp.179)
- Factual consistency (4 papers)
  It's now common to use pretrained language models (eg. BART) to generate summaries. But they tend to output summaries which contain information which are not in input text (ie. hallucination). This problem (factual inconsistency) prevents us to build cool applications with summarization models.
  - [CLIFF: Contrastive Learning for Improving Faithfulness and Factuality in Abstractive Summarization](https://aclanthology.org/2021.emnlp-main.532/)
  - [Fine-grained Factual Consistency Assessment for Abstractive Summarization Models](https://aclanthology.org/2021.emnlp-main.9/)
  - [Gradient-based Adversarial Factual Consistency Evaluation for Abstractive Summarization](https://aclanthology.org/2021.emnlp-main.337)
  - [MiRANews: Dataset and Benchmarks for Multi-Resource-Assisted News Summarization](https://aclanthology.org/2021.findings-emnlp.133)
- Grpah Neural Networks (4 papers).
  Graph neural networks work well to obtain better representation from input document.
  - [SgSum:Transforming Multi-document Summarization into Sub-graph Selection](https://aclanthology.org/2021.emnlp-main.333/)
  - [Multiplex Graph Neural Network for Extractive Text Summarization](https://aclanthology.org/2021.emnlp-main.11/)
  - [Frame Semantic-Enhanced Sentence Modeling for Sentence-level Extractive Text Summarization](https://aclanthology.org/2021.emnlp-main.331)
  - [Considering Nested Tree Structure in Sentence Extractive Summarization with Pre-trained Transformer](https://aclanthology.org/2021.emnlp-main.330/)
- multi document (4 paper)
  Given multiple input documents, provide a short summary covers their important points.
  - [Modeling Endorsement for Multi-Document Abstractive Summarization](https://aclanthology.org/2021.newsum-1.13/)
  - [SgSum:Transforming Multi-document Summarization into Sub-graph Selection](https://aclanthology.org/2021.emnlp-main.333/)
  - [Topic-Guided Abstractive Multi-Document Summarization](https://aclanthology.org/2021.findings-emnlp.126/)
  - [MSˆ2: Multi-Document Summarization of Medical Studies](https://aclanthology.org/2021.emnlp-main.594/)
- Controlled Generation (4 papers)
  Techniques to guide generating summaries to contain user-provided words/phrase.
  - [A Plug-and-Play Method for Controlled Text Generation](https://aclanthology.org/2021.findings-emnlp.334/)
  - [Transformer-based Lexically Constrained Headline Generation](https://aclanthology.org/2021.emnlp-main.335/)
  - [Decision-Focused Summarization](https://aclanthology.org/2021.emnlp-main.10/)
  - [Knowledge and Keywords Augmented Abstractive Sentence Summarization](https://aclanthology.org/2021.newsum-1.3)
- long input document (4 papers)
  Input texts in summarization are long, we need better/efficient ways to obtain representation.
  - [Enriching and Controlling Global Semantics for Text Summarization](https://aclanthology.org/2021.emnlp-main.744/)
  - [Topic-Guided Abstractive Multi-Document Summarization](https://aclanthology.org/2021.findings-emnlp.126/)
  - [HETFORMER: Heterogeneous Transformer with Sparse Attention for Long-Text Extractive Summarization](https://aclanthology.org/2021.emnlp-main.13/)
  - [Sparsity and Sentence Structure in Encoder-Decoder Attention of Summarization Systems](https://aclanthology.org/2021.emnlp-main.739)
- low-resource/data augmentation (3 papers)
  We are always lack of enough data, here is ways to tackle.
  - [Exploring Multitask Learning for Low-Resource Abstractive Summarization](https://aclanthology.org/2021.findings-emnlp.142/)
  - [Few-Shot Text Generation with Natural Language Instructions](https://aclanthology.org/2021.emnlp-main.32)
  - [Mitigating Data Scarceness through Data Synthesis, Augmentation and Curriculum for Abstractive Summarization](https://aclanthology.org/2021.findings-emnlp.175)
- analysis (3 papers)
  We still don't know much about how deep learning model behave.
  - [Does Pretraining for Summarization Require Knowledge Transfer?](https://aclanthology.org/2021.findings-emnlp.273/)
  - [A Thorough Evaluation of Task-Specific Pretraining for Summarization](https://aclanthology.org/2021.emnlp-main.12)
  - [Evaluation of Summarization Systems across Gender, Age, and Race](https://aclanthology.org/2021.newsum-1.6)
- multilingual (3 papers)
  Most of existing datasets are in English, we need a way to extend to other languages.
  - [Evaluation of Abstractive Summarisation Models with Machine Translation in Deliberative Processes](https://aclanthology.org/2021.newsum-1.7/)
  - [Models and Datasets for Cross-Lingual Summarisation](https://aclanthology.org/2021.emnlp-main.742)
  - [MassiveSumm: a very large-scale, very multilingual, news summarisation dataset](https://aclanthology.org/2021.emnlp-main.797/)
- reinforcement learning (RL) (2 papers)
  By using RL, you can add control directions how models learn to summarize.
  - [Using Question Answering Rewards to Improve Abstractive Summarization](https://aclanthology.org/2021.findings-emnlp.47)
  - [Rewards with Negative Examples for Reinforced Topic-Focused Abstractive Summarization](https://aclanthology.org/2021.newsum-1.4)
- copying mechanism (1 paper)
  Humans put phrases from input document in summaries, immitate this by models.
  - [Learn to Copy from the Copying History: Correlational Copy Network for Abstractive Summarization](https://aclanthology.org/2021.emnlp-main.336)
- multimodal  (1 paper)
  Visual features can provide auxiliary information to models.
  - [Vision Guided Generative Pre-trained Language Models for Multimodal Abstractive Summarization](https://aclanthology.org/2021.emnlp-main.326/)
- others
  I couldn't think of a good way to categorize them yet cool works.
  - [AUTOSUMM: Automatic Model Creation for Text Summarization](https://aclanthology.org/2021.emnlp-main.798)
  - [EASE: Extractive-Abstractive Summarization End-to-End using the Information Bottleneck Principle](https://aclanthology.org/2021.newsum-1.10)
  - [Sentence-level Planning for Especially Abstractive Summarization](https://aclanthology.org/2021.newsum-1.1)
  - [Event Graph based Sentence Fusion](https://aclanthology.org/2021.emnlp-main.334)
  - [Leveraging Information Bottleneck for Scientific Document Summarization](https://aclanthology.org/2021.findings-emnlp.345/)


# Big Problems

Having this overview makes me noticed two big issues in summarization. 1) evaluation, 2) factual consistency, and these two are closely related.
Since we don't know how to evaluate summaries properly, state-of-the-art models still generate summaries which contain wrong information.
Most of evaluation papers in the list focus on "to assess whether output summaries are consistent with input documents".
[Zhang+](https://aclanthology.org/2021.emnlp-main.531/) propose a hybrid (machine and human) way for evaluation.
[Zeng+](https://aclanthology.org/2021.emnlp-main.337/) shows adversarial samples can help evaluation for factual consistency.
While these work show approaches to evaluate/provide factual consistency, it seems there is still a big gap for real-life application.


# Conclusion

In this post, I tried to categorize almost all papers from EMNLP 2021 about summarization by some keywords to grasp the overview of the summarization field.
After the categorization, I listed two big problems we need to solve to bring the technologies into applications.
I hope this post help students who just started to study summarization like me to find their own interests.


# Appendix

## Personal 3 favorite papers

- [Finding a Balanced Degree of Automation for Summary Evaluation](https://aclanthology.org/2021.emnlp-main.531/)
  - tldr: Automated Pyramid evaluation frameworks in three difference levels.
  - why favorite?: Low-cost but high-quality evaluation method provided by combination of humans and machines.
- [Decision-Focused Summarization](https://aclanthology.org/2021.emnlp-main.10/)
  - tldr: Dataset extracted from Yelp to build a summarization model that helps decision making.
  - why favorite?: New task with clear purpose to help people by unique idea.
- [Does Pretraining for Summarization Require Knowledge Transfer?](https://aclanthology.org/2021.findings-emnlp.273/)
  - tldr: T5 pre-trained on nonsense corpus still performs well.
  - why favorite?: We still don't know much about DL models...

## list of summarizes

[Google Docs](https://docs.google.com/document/d/1wAn9w2GX6_ttYNP09MmoyJjvSNZOvf5k5mwJPPqNk4M/edit?usp=sharing) contains a list of papers above with short summaries.
