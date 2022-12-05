---
title: My Favorite Papers in 2022
updated: 2022-12-05
---

# Background

We are approaching to the end year where we need to re-review the papers read this year in Zotero library and pick the 10 favorite papers.

# Note

- The list below contains papers *I read* this year, not published this year.
- The order in the list is arbitrary.
- The list is highly biased by my preference (I read many in summarization and multilingual domain.).


# My Favorite Papers in 2022

- [Modelling Latent Translations for Cross-Lingual Transfer](https://arxiv.org/abs/2107.11353)
  - **Problem**: Translate-then-inference approach for cross-lingual transfer causes error propagation, error in the translation is amplified in the following inference phase.
  - **Approach**: They propose to train MT model and classification model jointly by using Minimum Risk Training framework.

- [Tuning Large Neural Networks via Zero-Shot Hyperparameter Transfer](https://openreview.net/forum?id=Bx6qKuBM2AD)
  - **Problem**: Hyperparameter tuning for large models is very costly.
  - **Approach**: They propose a framework where they find good hyperparameters on a smaller model which further use them in a large target model.

- [Does Corpus Quality Really Matter for Low-Resource Languages?](http://arxiv.org/abs/2203.08111)
  - **Problem**: It's unknown if text quality is important for pre-training a language model.
  - **Approach**: They collected texts from trusted websites in Basque and perform experiments if "quality" is important, and find that using high quality pre-training corpus does really improve performance on downstream tasks.

- [Are All the Datasets in Benchmark Necessary? A Pilot Study of Dataset Evaluation for Text Classification](https://aclanthology.org/2022.naacl-main.213)
  - **Problem**: It's unknown if models need to be evaluated on many classification datasets as we do now.
  - **Approach**: By experiments many models and datasets for classification, they show that there are some popular datasets which cannot distinguish models' ability.

- [Tiny-Attention Adapter: Contexts Are More Important Than the Number of Parameters](http://arxiv.org/abs/2211.01979)
  - **Problem**: Current adapter-based fine-futuning enables lighter training but underpeforms full-finetuning.
  - **Approach**: Propose a new architecture for adapter which can contextualize the input text, outperforms full fine-tuning and other adapters.

- [Human Interpretation of Saliency-based Explanation Over Text](https://arxiv.org/abs/2201.11569)
  - **Problem**: It's unknown that if explanations provided by a system are actually interpretable by humans.
  - **Approach**: They evaluate if saliency-based explanations can be interpreted by crowd-sourcing annotators, and show that they often misunderstand the explanations.

- [Detecting Stance in Scientific Papers: Did we get more Negative Recently?](http://arxiv.org/abs/2202.13610)
  - **Problem**: Many papers report strong results with deep learning approaches but also their problems.
  - **Approach**: They create a dataset of ML papers from 35 years time span, and perform analysis by using stance detection, showing more NLP papers are negative lately and negative papers receive more citations.

- [How "Multi" is Multi-Document Summarization?](http://arxiv.org/abs/2210.12688)
  - **Problem**: How much the information is scatter across document is not know in multi-document summarization datasets.
  - **Approach**: By using newly proposed formula, they show that many multi-document summarization datasets don't actually require for models to process multiple-documents.

- [What Makes a Good and Useful Summary? Incorporating Users in Automatic Summarization Research](https://aclanthology.org/2022.naacl-main.4/)
  - **Problem**: We don’t quite know that current direction of summarization research can actually help users.
  - **Approach**: They design a survey, and collected answers from students, and propose some understudied aspects required by them, e.g., multi-document summarization with user query.

- [Beam Decoding with Controlled Patience](http://arxiv.org/abs/2204.05424)
  - **Problem**: Current beam search can finish the exploration before completing a sentence.
  - **Approach**: They introduce "patience factor" which forces the search to finish a sentence before move on to the next beam, and show that it improves not much MT but summarization.
