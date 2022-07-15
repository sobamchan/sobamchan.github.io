---
title: ACL 2022 - A Summarization of Summarization Papers.
updated: 2022-07-15
---

<a href="https://imgur.com/tV7NMLE"><img src="https://i.imgur.com/tV7NMLE.png" title="source: imgur.com" /></a>  
Unexpected japanese object at Liège, Belgium.

# Introduction

39 summarization-related papers from [ACL 2022](https://aclanthology.org/events/acl-2022/).
Not all papers on summarization are covered because of time limitation.

I only skim-read many of the papers so there can be hullucinations or missing information, don't trust my summaries, if you find some interesting papers here, better read youself.
Feel free to contact me for mistakes and etc.

# Three personal favorites

- [Faithful or Extractive? On Mitigating the Faithfulness-Abstractiveness Trade-off in Abstractive Summarization](https://aclanthology.org/2022.acl-long.100)
  - **Problem**: There is no evaluation how much we give up abstractiveness over faifulness.
  - **Approach**: Propose a way to compute faithfulness abstractiveness trade-off curve by separating training data samples by extractiveness.

- [Hallucinated but Factual! Inspecting the Factuality of Hallucinations in Abstractive Summarization](https://aclanthology.org/2022.acl-long.236)
  - **Problem**: Factually correct hallucinations are not considered in existing works.
  - **Approach**: Proposed to use how a word probablity in a summary shifts given a input document to predict entity's hallucination and factuality.

- [Attention Temperature Matters in Abstractive Summarization Distillation](https://aclanthology.org/2022.acl-long.11)
  - **Problem**: BART is large. In current distillation, teacher output distribution is "too shart" for students.
  - **Approach**: By relaxing attention temperature, make signal easier for students.


# Others

- [Zero-Shot Aspect-Based Scientific Document Summarization using Self-Supervised Pre-training](https://aclanthology.org/2022.bionlp-1.5)
  - **Problem**: In existing datasets for research paper summarization, summaries focus on limited variety of aspects, limiting applications.
  - **Approach**: Using texts in each section from papers as signals to perform self-supervised leraning.

- [Read Top News First: A Document Reordering Approach for Multi-Document News Summarization](https://aclanthology.org/2022.findings-acl.51)
  - **Problem**: Simple documents concatenation ignores document importance. While summarization models tend to pay more attention to the beginneing of the inputs.
  - **Approach**: Before concatenating documents, order them by importance score obtained by supervised/unsupervised models.

- [GenCompareSum: a hybrid unsupervised summarization method using salience](https://aclanthology.org/2022.bionlp-1.22)
  - **Problem**: Transformer-based models have liminations on sequence length and require a lot of training data.
  - **Approach**: 

- [HiStruct+: Improving Extractive Text Summarization with Hierarchical Structure Information](https://aclanthology.org/2022.findings-acl.102)
  - **Problem**: Structure of the document is not considered.
  - **Approach**: Propose to use section names and sentence position to explicitly encode document structure.

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

- [DQ-BART: Efficient Sequence-to-Sequence Model via Joint Distillation and Quantization](https://aclanthology.org/2022.acl-short.22)
  - **Problem**: Efficient quantization for seq2seq models are not studied well.
  - **Approach**: Proposed a join framework of distillation and quantization to reduce model footprint by 16.5x.

- [Sparsifying Transformer Models with Trainable Representation Pooling](https://aclanthology.org/2022.acl-long.590)
  - **Problem**: Existing sparsing approaches don't drop entire connections to other units which prevents futher model size reduction.
  - **Approach**: Proposed to estimate importance scores for unit outputs to drop non-informative ones.

- [FrugalScore: Learning Cheaper, Lighter and Faster Evaluation Metrics for Automatic Text Generation](https://aclanthology.org/2022.acl-long.93)
  - **Problem**: Recent NLG metrics such as BERTScore are expensive to run.
  - **Approach**: Present smaller versions of variety of such models perform on par or even better than the original model.

- [Discriminative Marginalized Probabilistic Neural Method for Multi-Document Summarization of Medical Literature](https://aclanthology.org/2022.acl-long.15)
  - **Problem**: Many systems for multi-document summarization truncate input and miss valuable information.
  - **Approach**: Present a system with discriminator which finds worthy information from a cluster of documents.

- [Keywords and Instances: A Hierarchical Contrastive Learning Framework Unifying Hybrid Granularities for Text Generation](https://aclanthology.org/2022.acl-long.304)
  - **Problem**: Existing contrastive loss focus on instance level while there are words more important than the others in a sentence.
  - **Approach**: Introduce a hierarchie in a sentence to compute more precise contrastive loss.

- [A Variational Hierarchical Model for Neural Cross-Lingual Summarization](https://aclanthology.org/2022.acl-long.148/)
  - **Problem**: Two-staged pipeline approach performs better on cross-lingual summarization but it's expensive to run.
  - **Approach**: Propose to model summarization and translation separetely via latent variable.

- [BRIO: Bringing Order to Abstractive Summarization](https://aclanthology.org/2022.acl-long.207/)
  - **Problem**: Current autoregressive models don't care the quality of already generated tokens while inference time.
  - **Approach**: Propose to use contrastive loss to measure the relative qualities of candidate summaries.

- [EntSUM: A Data Set for Entity-Centric Summarization](https://aclanthology.org/2022.acl-long.237/)
  - **Problem**: There are no dataset to evaluate controllable summarization systems.
  - **Approach**: Present a new summarization dataset based on entities.

- [DYLE: Dynamic Latent Extraction for Abstractive Long-Input Summarization](https://aclanthology.org/2022.acl-long.118)
  - **Problem**: It is still challenging to summarize long texts.
  - **Approach**: Propose to jointly train extractor and generator with loss for each and joint consistency loss.

- [Benchmarking Answer Verification Methods for Question Answering-Based Summarization Evaluation Metrics](https://aclanthology.org/2022.findings-acl.296)
  - **Problem**: Answer verification methods for QA-based summarization evaluations are under-studied.
  - **Approach**: Analyzed four answer verification methods and found that LERC performs the best but not always reflected the summary evaluation quality.

- [A Well-Composed Text is Half Done! Composition Sampling for Diverse Conditional Generation](https://aclanthology.org/2022.acl-long.94)
  - **Problem**: It is challenging to generate texts about same information but in different surface.
  - **Approach**: Propose to first generate entity chain and then generate texts from it.

- [Spurious Correlations in Reference-Free Evaluation of Text Generation](https://aclanthology.org/2022.acl-long.102)
  - **Problem**: Reference-free summarization evaluation metrics can have spurious bias.
  - **Approach**: Show that there are spurious correlation such as simple word overlaps in model-based reference-free evaluation methods and propose a simple adversarial method to avoid them.

- [Mix and Match: Learning-free Controllable Text Generationusing Energy Language Models](https://aclanthology.org/2022.acl-long.31)
  - **Problem**: Controlling trained model's output text is expensive.
  - **Approach**: Propose an approach to its generation-time which utilizes pretrained blackbox models to guide the generation.
