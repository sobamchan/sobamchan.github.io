---
title: Publish a pip installable python package with Poetry
updated: 2023-01-11
---

# Background

I think it's an important role for researchers to make research outcome accessible, and with tools currently available for free, it's very easy publish softwares in the ways that other developers can use in their applications.


# Goal

In this article, we first write small scripts which let you train a SVM-based text classification model with Transformer-based feature and also use the trained model to make inferences. And later port these functionalities to CLI commands, so other people can pip-install and call it from terminal.

After tutorial, we will be able to do something like

```bash
> cool_python_lib train -f train.jsonl -o model.pkl
> cool_python_lib pred -m model.pkl -i "I like apple"  # 0 -> Positive
> cool_python_lib pred -m model.pkl -i "I hate apple"  # 1 -> Negative
```

the fisrt part, `cool_python_lib` is just a dummy packge name, you can set a name as you like.

# Preparation

Our library/project will be based on [Poetry](https://python-poetry.org).
Poetry is a package manager which works similary to pipenv but it provides more functionalities and better performance, and also it has usuful function with which you can easily publish your codes to pypi so it will be pip-installable.
So follow their [documentation](https://python-poetry.org/docs/#installation) and install on to your system.

After you installed Poetry, now you can make a poetry repository by simply running

```bash
> poetry new cool_python_lib
> cd cool_python_lib
> poetry shell  # to enter the environment
```

you can pick anything for <your-cool-lib-name> but if you want to later really upload this to pypi so others can pip-install, you need to pick a unique name which doesn't exist yet on the platform.
Of course you can easily chanage the name of this repository anytime you want.


# Install Dependencies

In this article, we will implement a SVM-based text classification model by using [scikit-learn](https://scikit-learn.org/stable/) so let's first install some external libraries we need on our poetry environment by running

```bash
> poetry add sienna scikit-learn sentence-transformers click
```

- sienna
  - A little library helps you to load json files easily
- scikit-learn
  - A mighty toolkit for ML projects.
- sentence-transformers
  - A easy to use feature extractor for texts.
- click
  - A utility package that makes package development super easy.


# Make some python files

We will write following three different python program files to achieve our goal.

- `./cool_python_lib/cli.py`
  - A script gathers functions from following two feature scripts and expose them to CLI interface by using the click package.
- `./cool_python_lib/train.py`
  - A script has a function (train) which takes a training data, train a model, and saves it as a pickle file.
- `./cool_python_lib/pred.py`
  - A script has a function (pred) which takes a text and a path to trained model, and makes a prediction.

You can make these files by just running,

```bash
touch ./cool_python_lib/cli.py ./cool_python_lib/train.py ./cool_python_lib/pred.py
```
