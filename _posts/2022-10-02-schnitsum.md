---
title: Schnitsum - Easy to use summarization package for CLI and Python.
updated: 2022-10-02
---

## TL;DR

Super easy to use, python package for text summarization ([GitHub page](https://github.com/sobamchan/schnitsum/)).


## Background

The amount of information in our world is sky rocketing with the raise of the internet and we're drowning (at least I am).
Same thing applies to research communities as well.
There are a lot of research papers publish every day, specially in computer science.
For young researchers such as myself, it is quite challenging to keep up-to-date with the state-of-the-art.

To ease this situation, the researchers in natural language processing are developing various technologies.
One successful instance is **Automatic Text Summarization**, a system/model which takes a long document (i.e., a research paper) and outputs a shorter summary covering essential points.
So we can find relevant papers without reading full texts but instead just one sentence summaries.

While we have many methodologies on this field, it is still not very accessible to people, even not to researchers themself.

As my first little step of improvement, in this article, I will introduce a python package which also provides a CLI command that let you utilize modern summarization models easily.


## Schinisum

The name was rather picked randomly after one iconic German dish (I'm a Ph.D. student in Germany) called [Schnitzel](https://en.wikipedia.org/wiki/Schnitzel), fried thin pork meat often with salty sauce and french fries.
I found it is quite difficult to type "schnitsum" with my keyboard but still happy with it.

Using this python package, you can easily use state-of-the-art models to generate short summaries for your documents of interests.

As an example, let's generate one sentence summary for an abstract below that is from a paper I and my colleagues published this year ([link](https://dl.acm.org/doi/10.1145/3529372.3530938)).

> The number of scientific publications nowadays is rapidly increasing, causing information overload for researchers and making it hard for scholars to keep up to date with current trends and lines of work. Consequently, recent work on applying text mining technologies for scholarly publications has investigated the application of automatic text summarization technologies, including extreme summarization, for this domain. However, previous work has concentrated only on monolingual settings, primarily in English. In this paper, we fill this research gap and present an abstractive cross-lingual summarization dataset for four different languages in the scholarly domain, which enables us to train and evaluate models that process English papers and generate summaries in German, Italian, Chinese and Japanese. We present our new X-SCITLDR dataset for multilingual summarization and thoroughly benchmark different models based on a state-of-the-art multilingual pre-trained model, including a two-stage `summarize and translate' approach and a direct cross-lingual model. We additionally explore the benefits of intermediate-stage training using English monolingual summarization and machine translation as intermediate tasks and analyze performance in zero- and few-shot scenarios. 

First, you need to install schnitsum with pip as following,

```sh
> pip install schnitsum
```

super easy!

By running this, additionally to the python package, you also now have a cli command which enables you to start without writing any python codes.

You can start right away by running,

```sh
> schnitsum --model-name sobamchan/bart-large-scitldr --text "Text you want to summaries."
```

So to summaries the abstract above, you can run,

```sh
> schnitsum --model-name sobamchan/bart-large-scitldr --text "The number of scientific publications nowadays is rapidly increasing, causing information overload for researchers and making it hard for scholars to keep up to date with current trends and lines of work. Consequently, recent work on applying text mining technologies for scholarly publications has investigated the application of automatic text summarization technologies, including extreme summarization, for this domain. However, previous work has concentrated only on monolingual settings, primarily in English. In this paper, we fill this research gap and present an abstractive cross-lingual summarization dataset for four different languages in the scholarly domain, which enables us to train and evaluate models that process English papers and generate summaries in German, Italian, Chinese and Japanese. We present our new X-SCITLDR dataset for multilingual summarization and thoroughly benchmark different models based on a state-of-the-art multilingual pre-trained model, including a two-stage 'summarize and translate' approach and a direct cross-lingual model. We additionally explore the benefits of intermediate-stage training using English monolingual summarization and machine translation as intermediate tasks and analyze performance in zero- and few-shot scenarios. "
```

(Because it needs to download the model, it takes a bit for the first time.)

And as an output, you will get,

> We present a new dataset for multilingual summarization in the scholarly domain and evaluate different models based on a state-of-the-art multilingual pre-trained model, including a two-stage'summarize and translate' approach and a direct cross-lingual model.

by the author point of view, I would say the summary is correct, provides a good overview of the original paper.

If you have multiple documents you want to summarize, you can first prepare a text file in which each line contains one document then pass it to schnitsum, ([sample file](https://github.com/sobamchan/schnitsum/blob/main/examples/docs.txt))

```sh
> schnitsum --model-name sobamchan/bart-large-scitldr --file docs.txt --opath summaries.txt
```

by setting the `--opath` argument, you can save the output summaries in a text file.
And if you have GPUs on your system, you can pass `--use-gpu` argment as well, it will be much faster.


## In Python

Of course, you can use schnitsum in python as well which makes it easy to integrate into your applications.
After you have it installed in your python environment by pip, you can use it as following,

```py
from schnitsum import SchnitSum

model = SchnitSum("sobamchan/bart-large-scitldr-distilled-3-3", use_gpu=False)
docs = [
    "Document you want to summarize."
]

summaries = model(docs)
print(summaries)
```

Easy no?


## Smaller Models

The model we used above is based on [BART-large](https://huggingface.co/facebook/bart-large) and it's quite memory/speed intensive (still possible run on a laptop), so I prepared some smaller versions so you can more easily generate summaries or integrate schnitsum to your applications.
To use them, you can simply change `--model-name` argument in the execution command, currently you can pick from one of the followings,

- [BART (large)](https://aclanthology.org/2020.acl-main.703) fine-tuned on computer science papers (ref. [SciTLDR](https://aclanthology.org/2020.findings-emnlp.428)).
  - Model name: `sobamchan/bart-large-scitldr`
- [BART (large)](https://aclanthology.org/2020.acl-main.703) fine-tuned on computer science papers (ref. [SciTLDR](https://aclanthology.org/2020.findings-emnlp.428)). Then distilled (by [`shrink and fine-tune`](http://arxiv.org/abs/2010.13002)) to have 65% parameters less.
  - Model name: `sobamchan/bart-large-scitldr-distilled-3-3`
- [BART (large)](https://aclanthology.org/2020.acl-main.703) fine-tuned on computer science papers (ref. [SciTLDR](https://aclanthology.org/2020.findings-emnlp.428)). Then distilled (by [`shrink and fine-tune`](http://arxiv.org/abs/2010.13002)) to have 37% parameters less.
  - Model name: `sobamchan/bart-large-scitldr-distilled-12-3`

For instance, running following command, the model will be much much smaller which results in faster generation.

```sh
> schnitsum --model-name sobamchan/bart-large-scitldr-distilled-3-3 --text "Text you want to summaries."
```

I will try to expand the list of supported models in the future, the latest list is [here](https://github.com/sobamchan/schnitsum/).


## Some Samples

To conclude this article, here, I list some of my recent favorite papers with one sentence summaries (model: sobamchan/bart-large-scitldr).
If you have any questions regarding to this package, feel free to raise a issue on [GitHub](https://github.com/sobamchan/schnitsum/), write me an [email](https://sotaro.io/about).

Enjoy!

- [Hallucinated but Factual! Inspecting the Factuality of Hallucinations in Abstractive Summarization](https://aclanthology.org/2022.acl-long.236/)
  - **TLDR**: We propose a novel detection approach that separates factual from non-factual hallucinations of entities.
- [What Makes a Good and Useful Summary? Incorporating Users in Automatic Summarization Research](https://aclanthology.org/2022.naacl-main.4/)
  - **TLDR**: We propose a survey methodology that can be used to investigate the needs of users of automatically generated summaries.
- [Does Pretraining for Summarization Require Knowledge Transfer?](https://aclanthology.org/2021.findings-emnlp.273/)
  - **TLDR**: We show that pretraining on documents consisting of character n-grams selected at random, we can nearly match the performance of models pretrained on real corpora.
- [Faithful or Extractive? On Mitigating the Faithfulness-Abstractiveness Trade-off in Abstractive Summarization](https://aclanthology.org/2022.acl-long.100/)
  - **TLDR**: We present a framework for evaluating the effective faithfulness of summarization systems, by generating a faithfulness-abstractiveness trade-off curve that serves as a control at different operating points on the abstractiveness spectrum.
- [BabelBERT: Massively Multilingual Transformers Meet a Massively Multilingual Lexical Resource](https://arxiv.org/abs/2208.01018)
  - **TLDR**: We show that multilingual lexical specialization of PLMs can improve performance in type-level lexical tasks and also enables generalization to languages with no lexical constraints.
