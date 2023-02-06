---
title: Publish a pip installable python package with Poetry
updated: 2023-01-11
---

This article in work-in-progree.

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

- `./cool_python_lib/train.py`
  - A script has a function (train) which takes a training data, train a model, and saves it as a pickle file.
- `./cool_python_lib/pred.py`
  - A script has a function (pred) which takes a text and a path to trained model, and makes a prediction.
- `./cool_python_lib/cli.py`
  - A script gathers functions from following two feature scripts and expose them to CLI interface by using the click package.

You can make these files by just running,

```bash
touch ./cool_python_lib/cli.py ./cool_python_lib/train.py ./cool_python_lib/pred.py
```

,

and each file should look like following inside.

## `./cool_python_lib/train.py`

There is just fuction written in this file which receives a path to a training file ([sample file](https://github.com/sobamchan/cool-python-lib/blob/main/example/sample.jsonl)) and a path you will save the trained model.

```py
import pickle

import click
import sienna
from sentence_transformers import SentenceTransformer
from sklearn.neural_network import MLPClassifier


@click.command()
@click.option(
    "-f", type=str, required=True, help="Path to jsonl file contains training samples."
)
@click.option("-o", type=str, required=True, help="Path to save trained model.")
def train(f: str, o: str) -> None:
    # Load jsonl file as a List[Dict]
    data = sienna.load(f)

    # Extract texts and labels for supervised learning.
    texts, labels = zip(*[(x["text"], x["label"]) for x in data])

    # Load sentence-transformer model.
    encoder = SentenceTransformer("sentence-transformers/paraphrase-albert-small-v2")

    # Get embeddings for each of text.
    embs = encoder.encode(texts, convert_to_numpy=True)

    # Train MLP classifier
    clf = MLPClassifier(random_state=1, max_iter=50).fit(embs, labels)

    # Save trained model as a pickle file
    with open(o, "wb") as fp:
        pickle.dump(clf, fp)
```

Because this function is wrapped by click, you can call this function like this `python cool_python_lib/train.py -f example/sample.jsonl -o model.pkl`.


## `./cool_python_lib/pred.py`

Here, we define a function which takes a model and a text as inputs, then makes a prediction (e.g., positive or negative).

```py
import pickle

import click
from sentence_transformers import SentenceTransformer
from sklearn.neural_network import MLPClassifier


@click.command()
@click.option("-m", type=str, required=True, help="Path to a trained model.")
@click.option("-t", type=str, required=True, help="Text to make a prediction on.")
def pred(m: str, t: str) -> None:
    # Load the same sentence-transformer as the train time to extract feature
    encoder = SentenceTransformer("sentence-transformers/paraphrase-albert-small-v2")

    # Load trained model
    with open(m, "rb") as fp:
        clf: MLPClassifier = pickle.load(fp)

    # Get embeddings for the input text.
    embs = encoder.encode([t], convert_to_numpy=True)

    # Predict!
    print(clf.predict(embs)[0])
```

Same as train.py, because this function is wrapped by click, you can call this function like this `python cool_python_lib/pred.py -m model.pkl -t "I love this movie."`.


## `./cool_python_lib/cli.py`

Using click, it's already simple to run scripts above to call functions we defined, but in this article, we want to make a cli tool so we need to wrap them into a callable package. This process is super easy with click's group functionality. Let's check how this script looks like.

```py
import click

from cool_python_lib.pred import pred
from cool_python_lib.train import train


@click.group()
def cli():
    # This is a group of commands, in following lines we register our commands.
    pass


cli.add_command(train)
cli.add_command(pred)


# This function is the "starting function" exposed to users.
def main():
    cli()
```

This script first makes a command group using `click.group()` and register our functions (`train` and `pred`) to it.
We call this group (`cli()`) in the main function which is the only function directly exposed to the users.


# Expose

We use a feature from poetry to make `main` function callable by users from cli, add following to your `pyproject.toml`.

```toml
[tool.poetry.scripts]
cool_python_lib = "cool_python_lib.cli:main"
```

This sets an alias that you can call from cli to `./cool_python_lib.cli:main` means that you can now run,

```bash
poetry install  # install a command to your system
cool_python_lib pred --help  # shows helper texts for this funtion.
```

Let's trying our first text classifier with our tool then,

```bash
cool_python_lib train -f ./example/sample.jsonl -o model.pkl
```

it takes some time to download sentence-transformer model but training itself with such a small data finishes instantly.

If you use the sample file provided in the [repo](https://github.com/sobamchan/cool_python_lib) corresponds to this article, you just trained a positive/negative classification model, let's try if it works.

```bash
cool_python_lib pred -m model.pkl -t "This movie is awesome"
# This should return `0` meaning it's positive

cool_python_lib pred -m model.pkl -t "I hate this stupid movie"
# This should return `1` meaning it's negative
```

Though, training data has only 4 samples, it predicts correctly as least for these simple cases.


# Publish

We now have our cli tool on our computer, let's publish this to [pypi.org](https://pypi.org) so other people can use this awesome tool.
It's super simple to do this with poetry just run,

```bash
poetry publish --build
```

this line first builds the source and wheels, the upload it to pypi.
To upload, you need have a user account there and configure it with poetry, details on that, [here](https://pypi.org/account/register/) and [here](https://python-poetry.org/docs/repositories/#configuring-credentials).
