---
title: ACL 2022: A Summarization of Summarization Papers.
updated: 2022-05-19
---

Work in Progress.

- [Zero-Shot Aspect-Based Scientific Document Summarization using Self-Supervised Pre-training](https://aclanthology.org/2022.bionlp-1.5)
  - **Problem**: In existing datasets for research paper summarization, summaries focus on limited variety of aspects, limiting applications.
  - **Approach**: Using texts in each section from papers as signals to perform self-supervised leraning.

- [Attention Temperature Matters in Abstractive Summarization Distillation](https://aclanthology.org/2022.acl-long.11)
  - **Problem**: BART is large. In current distillation, teacher output distribution is "too shart" for students.
  - **Approach**: By relaxing attention temperature, make signal easier for students.

- [Read Top News First: A Document Reordering Approach for Multi-Document News Summarization](https://aclanthology.org/2022.findings-acl.51)
  - **Problem**: Simple documents concatenation ignores document importance. While summarization models tend to pay more attention to the beginneing of the inputs.
  - **Approach**: Before concatenating documents, order them by importance score obtained by supervised/unsupervised models.

- [GenCompareSum: a hybrid unsupervised summarization method using salience](https://aclanthology.org/2022.bionlp-1.22)
  - **Problem**: Transformer-based models have liminations on sequence length and require a lot of training data.
  - **Approach**: 

- [HiStruct+: Improving Extractive Text Summarization with Hierarchical Structure Information](https://aclanthology.org/2022.findings-acl.102)
  - **Problem**: Structure of the document is not considered.
  - **Approach**: Propose to use section names and sentence position to explicitly encode document structure.

- [Faithful or Extractive? On Mitigating the Faithfulness-Abstractiveness Trade-off in Abstractive Summarization](https://aclanthology.org/2022.acl-long.100)
  - **Problem**: There is no evaluation how much we give up abstractiveness over faifulness.
  - **Approach**: Propose a way to compute faithfulness abstractiveness trade-off curve by separating training data samples by extractiveness.

- [Length Control in Abstractive Summarization by Pretraining Information Selection](https://aclanthology.org/2022.acl-long.474)
  - **Problem**: Most length-controling happens in decoding time only. How to encode is not considered.
  - **Approach**: Propose to train a model with length-aware attention mechanism on length balanced dataset then fine-tune.

- [HIBRIDS: Attention with Hierarchical Biases for Structure-aware Long Document Summarization](https://aclanthology.org/2022.acl-long.58)
  - **Problem**: Introducing hierarchical feature to transformer models is not trivial.
  - **Approach**: Propose to include learnable biases that attention regarding to the word positions.

- [Neural Label Search for Zero-Shot Multi-Lingual Extractive Summarization](https://aclanthology.org/2022.acl-long.42)
  - **Problem**: Greedly selected sentence for extractive annotation may not be chosen in other languages when they are translated.
  - **Approach**: By using multiple MT methods to create multiple labels and use a model to weight those different labels.

- [NEWTS: A Corpus for News Topic-Focused Summarization](https://aclanthology.org/2022.findings-acl.42)
  - **Problem**: Theme/topic-guided summarization systems are yet difficult to be used because of lack of benchmark datasets.
  - **Approach**: Extend CNN/Dailymail dataset to provide with two summaries focused on different topics for each document.

- [End-to-End Segmentation-based News Summarization](https://aclanthology.org/2022.findings-acl.46)
  - **Problem**: Current news summarization systems focus on generating one general summary for a whole article.
  - **Approach**: Present a dataset which segments articles into sections with summary for each section.

- [Revisiting Automatic Evaluation of Extractive Summarization Task: Can We Do Better than ROUGE?](https://aclanthology.org/2022.findings-acl.122)
  - **Problem**: ROUGE lacks semantic understanding so novel words hurt the scores.
  - **Approach**: Propose to create extractive summarization labels by utilizing several sentence embedding models.

- [Training Dynamics for Text Summarization Models](https://aclanthology.org/2022.findings-acl.163)
  - **Problem**: There are not many studies about how models learn to generate summaries.
  - **Approach**: Found that models first learn to copy and then later start to do hullucinations.

- [Controlling the Focus of Pretrained Language Generation Models](https://aclanthology.org/2022.findings-acl.260)
  - **Problem**: Current models learn to attend to relavant part so that users can't intervent.
  - **Approach**: Propose to use trainable focus vectors to control models where to attend without touching the underying models.

- [Should We Trust This Summary? Bayesian Abstractive Summarization to The Rescue](https://aclanthology.org/2022.findings-acl.325)
  - **Problem**: For applications, it's important to estimate the output summaries from models.
  - **Approach**: By using Monte Carlo dropout, extend exising summarization models to variational variants and enable to provide the uncertainty.

- [Updated Headline Generation: Creating Updated Summaries for Evolving News Stories](https://aclanthology.org/2022.acl-long.446)
  - **Problem**: Current summarization tasks don't consider cases that the information dynamicaly get updated.
  - **Approach**: Propose a updated headline generation task/dataset in which system needs to identify the new information and update headline accordingly.

- [ASPECTNEWS: Aspect-Oriented Summarization of News Documents](https://aclanthology.org/2022.acl-long.449)
  - **Problem**: In many cases, users want aspect specific summaries rather than general ones but datasets for this is limited.
  - **Approach**: Annotated disaster related articles with summaries focusing on two aspects, geo and recovery.

- [MemSum: Extractive Summarization of Long Documents Using Multi-Step Episodic Markov Decision Processes](https://aclanthology.org/2022.acl-long.450)
  - **Problem**: Existing systems score sentences without updating after sentence selection which leads to redundant summaries.
  - **Approach**: By using RL, select sentences with reference to the current selection history.

- [Automatically Discarding Straplines to Improve Data Quality for Abstractive News Summarization](https://aclanthology.org/2022.nlppower-1.5)
  - **Problem**: References summaries contain non-summary texts because they were automatically scraped from news websites.
  - **Approach**: Proposed rule-based cleaning method and show it improves summary quality.

- [Graph Enhanced Contrastive Learning for Radiology Findings Summarization](https://aclanthology.org/2022.acl-long.320)
  - **Problem**: Existing works treat extra knowledge data separatedly from input.
  - **Approach**: Proposed a unified way to integrate knowledge graph with input text by using contrastive loss.

- [A Multi-Document Coverage Reward for RELAXed Multi-Document Summarization](https://aclanthology.org/2022.acl-long.351)
  - **Problem**: Popular negative loss likelihood has problems such as exposure bias for multi-document summarization as well.
  - **Approach**: Proposed a reward function which takes ROUGE and input text coverage into account.

- [SummaReranker: A Multi-Task Mixture-of-Experts Re-ranking Framework for Abstractive Summarization](https://aclanthology.org/2022.acl-long.309)
  - **Problem**: Because of the large search space, decoding process is challenging.
  - **Approach**: Proposed a Mixture-of-experts model which reranks the generated summary candidates.

- [PRIMERA: Pyramid-based Masked Sentence Pre-training for Multi-document Summarization](https://aclanthology.org/2022.acl-long.360)
  - **Problem**: Existing pretrained language models for text generation are for single document.
  - **Approach**: Proposed a longformer-based model which can attention globally, and a new pretraining task called gap sentence generation.

- [Summ$^N$: A Multi-Stage Summarization Framework for Long Input Dialogues and Documents](https://aclanthology.org/2022.acl-long.112)
  - **Problem**: Recently large models have difficulty processing long texts efficiently.
  - **Approach**: Proposed to generate summaries in arbitrary number of stages so can process long documents.

- [Learning Non-Autoregressive Models from Search for Unsupervised Sentence Summarization](https://aclanthology.org/2022.acl-long.545)
  - **Problem**: Edit-based unsupervised approach can be slow and constrain to keep the input word order.
  - **Approach**: Proposed to generate training samples by edit-based approach, train a non-autoregressive model on them.

- [Hallucinated but Factual! Inspecting the Factuality of Hallucinations in Abstractive Summarization](https://aclanthology.org/2022.acl-long.236)
  - **Problem**: Factually correct hallucinations are not considered in existing works.
  - **Approach**: Proposed to use how a word probablity in a summary shifts given a input document to predict entity's hallucination and factuality.

- [DQ-BART: Efficient Sequence-to-Sequence Model via Joint Distillation and Quantization](https://aclanthology.org/2022.acl-short.22)
  - **Problem**: Efficient quantization for seq2seq models are not studied well.
  - **Approach**: Proposed a join framework of distillation and quantization to reduce model footprint by 16.5x.

- [Sparsifying Transformer Models with Trainable Representation Pooling](https://aclanthology.org/2022.acl-long.590)
  - **Problem**: Existing sparsing approaches don't drop entire connections to other units which prevents futher model size reduction.
  - **Approach**: Proposed to estimate importance scores for unit outputs to drop non-informative ones.

- []()
  - **Problem**: 
  - **Approach**: 

- []()
  - **Problem**: 
  - **Approach**: 

- []()
  - **Problem**: 
  - **Approach**: 

- []()
  - **Problem**: 
  - **Approach**: 

- []()
  - **Problem**: 
  - **Approach**: 

- []()
  - **Problem**: 
  - **Approach**: 

- []()
  - **Problem**: 
  - **Approach**: 

- []()
  - **Problem**: 
  - **Approach**: 
