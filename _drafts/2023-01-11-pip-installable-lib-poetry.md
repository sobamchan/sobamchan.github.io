---
title: Publish a pip installable python package with Poetry
updated: 2023-01-11
---

# Background

I think it's an important role for researchers to make research outcome accessible, and with tools currently available for free, it's very easy publish softwares in the ways that other developers can use in their applications.


# Goal

In this article, we first write small scripts which let you train a SVM-based text classification model and also use the trained model to make inferences. And later port these functionalities to CLI commands, so other people can pip-install and call it from terminal.

After tutorial, we will be able to do something like

```bash
> awesome-lib train -f train.csv -o model.pkl
> awesome-lib pred -m model.pkl -i "i like apple"
```


# Preparation

Our library/project will be based on [Poetry](https://python-poetry.org).
Poetry is a package manager which works similary to pipenv but it provides more functionalities and better performance, and also it has usuful function with which you can easily publish your codes to pypi so it will be pip-installable.
So follow their [documentation](https://python-poetry.org/docs/#installation) and install on to your system.

After you installed Poetry, now you can make a poetry repository by simply running

```bash
> poetry new <your-cool-lib-name>
> cd <your-cool-lib-name>
> poetry shell  # to enter the environment
```

you can pick anything for <your-cool-lib-name> but if you want to later really upload this to pypi so others can pip-install, you need to pick a unique name which doesn't exist yet on the platform.
Of course you can easily chanage the name of this repository anytime you want.


# Install Dependencies

In this article, we will implement a SVM-based text classification model by using [scikit-learn](https://scikit-learn.org/stable/) so let's first install some external libraries we need on our poetry environment by running

```bash
> poetry add scikit-learn pandas
```
