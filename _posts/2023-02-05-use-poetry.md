---
title: Just Use Poetry
updated: 2023-02-05
---

# Reproducability

- `pyproject.toml`
  - has also all the pkg with version you installed as well as python version used in the repo
  - everytime you install something, this file gets updated
    - with this you never forget to log all the dependencies
    - do you `pip freeze` every time install install a package?
    - no you don't
    - so [this](https://github.com/mia-workshop/MIA-Shared-Task-2022/issues/5) happends
  - `pip freeze` can't remember which pkg you installed youself
- `poetry.lock`
- pip tries to resolve dependencies but doesn't handle conflicts well
  - more on that [here](https://blogs.sap.com/2022/05/08/why-you-should-use-poetry-instead-of-pip-or-conda-for-python-projects/)


# Features

- Poetry can also take care of virtualenv
- Doesn't install packages you don't need
  - anaconda comes with a bunch of packages you don't use
  - conda installs unnecessary packages for some reason ([ref](https://blogs.sap.com/2022/05/08/why-you-should-use-poetry-instead-of-pip-or-conda-for-python-projects/))
- you can define a command in pyproject.toml
- Poetry has clear way of spliting dependency groups in pyproject.toml
- publish your package super easily
- `poetry show hoge --tree` for dependency tree


# Usage

## Installation

### 1. Install pyenv

Poetry uses one of python versions installed on your machine, use [pyenv](https://github.com/pyenv/pyenv) for managing python itself. 

### 2. Install Poetry

Installing Poetry can be done by one command, refer [the official documentation](https://python-poetry.org/docs/#installation).

### 3. Create a new project repository

Use `poetry new <repo-name>` to start a new project, it creates few files/dirs including `pyproject.toml`. Use `poetry init` in a directory which already exists to convert to Poetry repository.

### 4. Install a package

Use `poetry add <pkg-name>` to install a package, it will also update `pyproject.toml` and `poetry.lock` (Unlike pip).

If you want a package for testing or development purposes but not required for the main code base (e.g., pytest, pudb, black or isort), you can define a package group so future users of your repo can skip installing these. Just run `poetry add -g dev pytest` and checkout `pyproject.toml`. A user can install everything self but this by `poetry install --only main` or `poetry install --without dev`.

### 5. Do you work

Enter to the virtualenv by running `poetry shell` then run your scripts normaly (e.g., `python main.py`) or without entering the env you can run `poetry run python main.py`.

### 6. Register a command

Add something like below in `pyproject.toml` so you have a alias for a command you use offten, it helps other people to use your repository.

```bash
[tool.poetry.scripts]
train-model = "<repo-name>.train:run"
```

After having this block in the file, you can use `poetry run train-model` as an alias for `python <repo-name>/train.py:run`.
Doesn't look much different but it works quite well with [click](https://github.com/pallets/click) to develop a command line tool. More on that on another article.

### 7. Publish your package

`poetry publish --build` first builds a python package from your code, and upload it to [pypi.org](https://pypi.org) so other people can install it for their project.



# references

- [Stop using Pip, use Poetry Instead!](https://nanthony007.medium.com/stop-using-pip-use-poetry-instead-db7164f4fc72)
- [Why you should use Poetry instead of Pip or Conda for Python Projects](https://blogs.sap.com/2022/05/08/why-you-should-use-poetry-instead-of-pip-or-conda-for-python-projects/)
