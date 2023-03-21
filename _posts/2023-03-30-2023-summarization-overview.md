---
title: Overview of summarization (2023 edition)
updated: 2023-03-20
---

## Background

Last week, I gave a presentation titled "Overview of Tasks and Challenges in Automatic Text Summarization" for a company my friend works for, it sounds very ambiguous to give a talk like this but I did my best to compile my knowledge.

I find a list of challenges I made for this talk useful for me to focus on (what I think) meaningful topics to work on for rest of my Ph.D. rather than doing research to get papers published.
I write this post as a reminder and reference for myself (and possibly people starting to work on text summarization).

Following texts are written based on slides I made so the format may not be perfect.

---

## Abstractive vs Extractive

- Abstractive Summarization
  - generates a summary given a input document,
  - (ideally) can cover multiple points from multiple sentences in one short summary,
  - but summary can be factually/grammatically wrong
- Extractive Summarization 
  - picks salient sentence(s) from the given document,
  - can provide a summary that is consistent to the input document [Zhang et al. 2022],
  - but its summary can be incomplete, too long, not covering many points

I personally like Abstractive Summarization.  Short is Good.


## Various Summarizations

### Single Document Summarization

- IN: One document
- OUT: One summary
- Case: “Give me one summary of this paper”
- Datasets
  - CNN/Daily: News articles
  - XSum: News article
  - NYT: News article
  - Wikihow: Instructions, how-tos
  - SciTLDR: Research papers

### Multi Document Summarization

- IN: Multiple documents
- OUT: One summary
- Case: “Give me an overview of this list of papers”
  - set of documents given
- Case: “Give me a summary on Text summarization”
  - no set of documents given
  - need to retrieve first
- Datasets
  - DUC-2004: News articles
  - MS2: Medical systematic literature reviews
  - Wikisum: Wikipedia articles
  - Multi-News: News articles
  - Multi-XSci: Related sections in research papers


### Query-focused Summarization

- IN: Single/Multiple documents + User provided query
- OUT: One summary focuses on the query request
- Case: “What does this article say about economy?”
  - One can say it’s more abstract QA task
  - Need to generate different summaries depending queries on a same documents
- Datasets
  - DUC2005-2007: News articles
  - TD-QFS: Medical articles


### Multi-aspect Summarization

- IN: Single document
- OUT: Multiple summaries (on different aspects)
- Case: “Give me one summary for each of purpose and method of this paper”
  - Similar to QFS but queries are fixed
- Datasets
  - FacetSum: Research journal papers


### Some other tasks

- Instance of multi-document summarization
  - Dialogue/Conversation summarization
  - Review summarization
- Special input format
  - Legal document summarization
  - Long document summarization
- Special output format
  - Long summary generation


## My personal interest now

Multi-aspect summarization

- I like generating summaries for research papers
- Research papers always have multiple aspects (objective, method, result, etc…)
- Having short summaries for each aspect would help me reading papers


## What are people working on now?


Refer my another blog post: [A Summarization of Summarization Papers from EMNLP 2021](https://sotaro.io/posts/summarization-of-summarization-emnlp-2021)


### Personal Highlights

- Factual consistency
  - Summaries sometimes contain factually incorrect information
  - We want to detect them to evaluate or avoid
- Evaluation frameworks
  - ROUGE (uses n-gram based overlap) can only assess text surface
  - We need something more sophisticated!


## Current challenges (I think)

### Evaluation

ROUGE [Lin 2004] is not enough but we don’t know what is…

ROUGE
- computes n-gram overlap between candidate and reference summaries
- is fast, simple and interpretable
- but cannot handle many things (e.g., paraphrase, word importance…)

Recently some papers report BERTScore [Zhang 2019] but it also has some downsides…

BERTScore
- uses semantic similarity based on BERT model
- it can take deeper semantic into account
- but it has low interpretability, can’t understand output scores

Problems
- We yet don’t know which method is effective which task
- Do we want blackbox evaluation metrics?


### Limited dataset

Do we really interested in generating headlines for news (CNN/DailyMail)?
Or Abstracts/Related work sections of research papers?

> Because we rely on chance in finding these summaries, we are beholden to whatever domain they come from, rather than the domain we are interested in. [Alex et al. 2022]

Let’s think ground-up.
- For which documents, do we actually want summaries?
- How can we build dataset for it?


---

## Conclusion

I think **Evaluation** and **Dataset creation** are the two important directions in summarization field.
