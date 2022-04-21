---
title: Papers on Guided Text Generation.
updated: 2022-03-07
---

# tl;dr

A list of papers about guided summarizations with short summaries.

# Introduction

When we build abstractive summarization systems, it is important that generated summaries contain certain keywords to deliver precise information.
However, it is not trivial to controll the behaviour of deep learning-based models which are currently dominant in the field.
There are quite many works that try to tackle this problem recently.
To grasp an overview, in this post, I will list papers I read related to this topic first, and then try to categorize them by approaches.

**Disclaimer**: This list is far from comprehensive and I intend to keep updating overtime.

# List

- [A Plug-and-Play Method for Controlled Text Generation](https://aclanthology.org/2021.findings-emnlp.334)
  - Use keyword and it's word embedding to shfit distribution over vocabulary during generation step.
- [GSum: A General Framework for Guided Neural Abstractive Summarization](https://aclanthology.org/2021.naacl-main.384/)
  - Unified way to handle different types of guidance signals.
- [Transformer-based Lexically Constrained Headline Generation](https://aclanthology.org/2021.emnlp-main.335/)
  - Simple guaranteed way to include provided keywords/key phrases by generating bi-directionally from given words.
- [Guiding Generation for Abstractive Text Summarization Based on Key Information Guide Network](https://aclanthology.org/N18-2009)
  - Use representations of automatically extracted keywords from input document to modify transformer encoder's attention.
- [Abstractive Summarization with Combination of Pre-trained Sequence-to-Sequence and Saliency Models](https://arxiv.org/abs/2003.13028)
  - Multitask learning of saliency detection task with pseudo labels to enhance attention for keywords.
- [Highlight-Transformer: Leveraging Key Phrase Aware Attention to Improve Abstractive Multi-Document Summarization](https://aclanthology.org/2021.findings-acl.445)
  - Use tf-idf to re-weight self-attention for multi-document summarization.
- [EntSUM: A Data Set for Entity-Centric Summarization](http://arxiv.org/abs/2204.02213)
  - New dataset in which summaries are build around entities.
- [Entity-Aware Abstractive Multi-Document Summarization](https://aclanthology.org/2021.findings-acl.30)
  - Use co-erfeernce resolution and graph NN on top of it to extract entity features, and use for multi-document summarization.
- [Planning with Learned Entity Prompts for Abstractive Summarization](https://direct.mit.edu/tacl/article/doi/10.1162/tacl_a_00438/108867/Planning-with-Learned-Entity-Prompts-for)
  - Generate scaffold of summary with named entities and numbers first, then generate full summary around them.
- [Keywords-Guided Abstractive Sentence Summarization](https://ojs.aaai.org/index.php/AAAI/article/view/6333)
  - Train a keyword extractor on overlapping words between input document and reference summary, then use extracted keywords via gating mechanism as additional signal for encoder.
- [CTRLEval: An Unsupervised Reference-Free Metric for Evaluating Controlled Text Generation](http://arxiv.org/abs/2204.00862)
  - Use PLMs to fill-in-the-bank to evaluate multi-aspect of summaries.
- [Plug and Play Language Models: A Simple Approach to Controlled Text Generation](https://openreview.net/forum?id=H1edEyBKDS)
  - Use signal from an additional style/domain classifier to modify the likelihood from the generation model to change the behaviour without futher fine-tuning.
- [CoCon: A Self-Supervised Approach for Controlled Text Generation](https://openreview.net/forum?id=VD_ozqvBy4W)
  - Train additional layer to complement the second half of a sentence given the first half which let us control generation on word/sentence -level signals.
