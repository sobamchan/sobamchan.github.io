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

- []()
  - **Problem**: 
  - **Approach**: 
