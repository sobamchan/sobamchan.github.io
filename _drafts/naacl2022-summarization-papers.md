---
title: NAACL 2022 - A Summarization of Summarization Papers.
updated: 2022-07-18
---


- [FactPEGASUS: Factuality-Aware Pre-training and Fine-tuning for Abstractive Summarization](https://aclanthology.org/2022.naacl-main.74)
  - **Problem**: Summarization models can generate factually incorrect information.
  - **Approach**: Propose to extend pretraining objective of PEGASUS with FactCC during the pseudo-summary selection process.

- [An Exploration of Post-Editing Effectiveness in Text Summarization](https://aclanthology.org/2022.naacl-main.35)
  - **Problem**: Human-machine hybrid approach for summarization is understudied.
  - **Approach**: By experiments with 72 people on two summarization datasets, they show that when a person doesn't know the domain, post-editing approach helps but otherwise not much.

- [TSTR: Too Short to Represent, Summarize with Details! Intro-Guided Extended Summary Generation](https://aclanthology.org/2022.naacl-main.25)
  - **Problem**: Abstract-long sumamries are not informative enough for documents like scholarly documents.
  - **Approach**: Propose a model which uses introduction text as pointer feature to the main text to select salient information.

- [What Makes a Good and Useful Summary? Incorporating Users in Automatic Summarization Research](https://aclanthology.org/2022.naacl-main.4)
  - **Problem**: We don't quite know that current direction of summarization research can actually help users.
  - **Approach**: Designed a survey, and collected answers from students, and propose some understudied aspects required by them.

- [Falsesum: Generating Document-level NLI Examples for Recognizing Factual Inconsistency in Summarization](https://aclanthology.org/2022.naacl-main.199)
  - **Problem**: Using NLI models to compare input document and hypothesis is not straighforward.
  - **Approach**: Propose a pipeline to generate pairs of documents and hypothesis to train NLI models for factual incosistency detection.

- [Exploring Neural Models for Query-Focused Summarization](https://aclanthology.org/2022.findings-naacl.109)
  - **Problem**: Contributions to query-focused summarization is increasing but there is no comprehensive study on models.
  - **Approach**: Systematic study on two approaches, two-stage extractive-abstract and end-to-end, and also the effectiveness of transfer learning, and two extensions.

- [Reference-free Summarization Evaluation via Semantic Correlation and Compression Ratio](https://aclanthology.org/2022.naacl-main.153)
  - **Problem**: Shannon score, by generate source document w/ or w/o summary as prompt, to computes information and compare to evaluate summaries but ignores saliency and token position.
  - **Approach**: Propose to extend Shannon score to compute the correlation of distributions w/ or w/o summary prompt to take saliency adn token position into account.

- [Investigating Crowdsourcing Protocols for Evaluating the Factual Consistency of Summaries](https://aclanthology.org/2022.naacl-main.417)
  - **Problem**: There are no standardalized human evaluation method for factual consistency of summarization systems.
  - **Approach**: Performed cloudsource-based human evaluation on various models for factual consistency to analyze the best setup.

- [Proposition-Level Clustering for Multi-Document Summarization](https://aclanthology.org/2022.naacl-main.128)
  - **Problem**: Sentence level clustering for multi-document summarization can be noisy and redundant.
  - **Approach**: Propose to perform clustering on proposition-level to obtain more precise salient pieces of texts.

- [Improving Multi-Document Summarization through Referenced Flexible Extraction with Credit-Awareness](https://aclanthology.org/2022.naacl-main.120)
  - **Problem**: Extract-then-abstract approach for multi-document summarization has some problems, such as quality of pseudo oracles for extraction model.
  - **Approach**: 

- [Does Summary Evaluation Survive Translation to Other Languages?](https://aclanthology.org/2022.naacl-main.173)
  - **Problem**: Extending summarization datasets to other languages is expensive with manual annotations.
  - **Approach**: By translating English SumEval dataset to seven languages, they evaluated whether they can still use English human scores to evaluate qualities after machine translation.

- [SueNes: A Weakly Supervised Approach to Evaluating Single-Document Summarization via Negative Sampling](https://aclanthology.org/2022.naacl-main.175)
  - **Problem**: Reference-free evaluation models often based on non summarizatino datasets such as QA which introduce noises and biases.
  - **Approach**: By mutating reference summaries, they propose to generate training samples for reference free summary evaluation models.

- [Masked Summarization to Generate Factually Inconsistent Summaries for Improved Factual Consistency Checking](https://aclanthology.org/2022.findings-naacl.76)
  - **Problem**: Obtaining factually incorrect summaries yet relevant to the source text is challenging.
  - **Approach**: Propose to generate factually incorrect summaries by masking key information in the reference summaries.

- [Improving the Faithfulness of Abstractive Summarization via Entity Coverage Control](https://aclanthology.org/2022.findings-naacl.40)
  - **Problem**: Applying pre-training language models to abstractive summarization is known to lead generating unfaithful summaries.
  - **Approach**: Propose to prepend a new special token computed by number of named entity overlap between source text and reference summary to inform model the level of faithfullness.

- [ExtraPhrase: Efficient Data Augmentation for Abstractive Summarization](https://aclanthology.org/2022.naacl-srw.3)
  - **Problem**: Obtaining abstractive summarization dataset is expensive.
  - **Approach**: Propose a two-step method that generates pseudo summaries, first extract salient sentences from a text, second generate paraphrases of them.

- [Interactive Query-Assisted Summarization via Deep Reinforcement Learning](https://aclanthology.org/2022.naacl-main.184)
  - **Problem**: Current neural models for interactive summarization models have latency problem prevents from real-time processing.
  - **Approach**: Propose to decompose the interactive summarization system actions into 1) initial summary and query responses generation and 2) generation of suggested queries, and model them with reinforcement learning.

- [NeuS: Neutral Multi-News Summarization for Mitigating Framing Bias](https://aclanthology.org/2022.naacl-main.228)
  - **Problem**: How each media frame a savme event in their articles differ depending on its political learnings.
  - **Approach**: Present a new task/dataset aiming to generate framing-bias-free summaries from articles with different political bias.

- [FactGraph: Evaluating Factuality in Summarization with Semantic Graph Representations](https://aclanthology.org/2022.naacl-main.236)
  - **Problem**: Graph representations of texts are not yet used to evaluation factual aspect of summarization systems.
  - **Approach**: Propose to AMR and adapter enhanced models to evaluate summaries for factuality.

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
