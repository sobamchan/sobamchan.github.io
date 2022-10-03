---
title: Generate Summaries for Your Zotero Library
updated: 2022-10-03
---

## TL;DR

Easily generate summaries for papers in your Zotero library


## Background

One of my hobby projects now is developing tools to make **automatic text summarization** technology more accessible.
Recent product came out of this is [schnitsum](https://sotaro.io/posts/schnitsum) which enables you to easily utilize state-of-the-art summarization models on a terminal or in your python applications.

While this works well for many developers who actually know how to build softwares, it still requires some work to make this package integrated to your life.
To this end, in this article, I will introduce a mini python app builds on top of this schnitsum, and generates one sentence summaries for papers in your [Zotero](https://www.zotero.org/) library.


## Zotero TLDR API

## Overview

[Here](https://github.com/sobamchan/zotero_tldr_api) is the GitHub repo.

A script in the repo does,

1. Download N most recently added papers in your library (default: N=100)
2. Extract abstracts of those papers
3. Use deep learning based summarization model to generate one sentence summaries
4. Save generated summaries as notes related to your papers back in your Zotero library

so by running this script once in a while, you always have summaries of papers which helps you to grasp the overview quickly.


## Installation

Download/Clone the repo first,

```sh
> git clone git@github.com:sobamchan/zotero_tldr_api.git
```

then, if you use Poetry (recommended), you can just run

```sh
> poetry env use 3.9.5
> poetry install
```

or with pip, you can

```sh
> pip install -r requirements.txt
```

and now you have all the dependencies installed.


## Run

To access your zotero library from this python script, you need to pass your user id and API key.
To obtain these information, visit Zotero user account page ([link](https://www.zotero.org/settings/keys)).
If you haven't generated an API key before, generate one and keep it somewhere because we will use in in the next step.

Now you're all setup, let's start generating summaries!

Run following command,

```sh
> python main.py --model-name sobamchan/bart-large-scitldr --user-id <zotero_user_id> --zotero-key <zotero_user_key> --limit 10
```

this will generate summaries for 10 most recent papers in your Zotero library.

Now, if you go back to your Zotero App and check the most recently added paper, you will see a note attached with one sentence summary.

<a href="https://imgur.com/Sn0hALn"><img src="https://i.imgur.com/Sn0hALn.png" title="source: imgur.com" /></a>  
Like this

Increase `--limit` argument to do it for more papers.
You can change `--model-name` as well to meet your need.
For instance, setting `--model-name sobamchan/bart-large-scitldr-distilled-3-3`, model to be used will be smaller so it runs faster.
To know other model options, check out the [documentation of schnitsum](https://github.com/sobamchan/schnitsum/).


## Conclusion

Now you can have summaries generate by the state-of-the-art model in your library to go.

Feel free to contact me related to this project by raising [GitHub issues](https://github.com/sobamchan/zotero_tldr_api/issues) or via [email](https://sotaro.io/about).

Happy Reading!
