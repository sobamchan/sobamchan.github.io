---
title: Papers on Guided Text Generation.
updated: 2022-03-07
---

WORK IN PROGRESS

# Introduction
List of papers about guided summarizations with short summaries.

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

