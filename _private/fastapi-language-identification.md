---
title: "fastapi と fasttext で fast に作る，言語判定 API"
date: 2020-04-25T18:06:49+09:00
draft: false
toc: false
images:
  - /imgs/fastapi-language-identification.jpg
tags:
  - nlp
  - ml
  - web
  - api
---

{{< figure src="/imgs/fastapi-language-identification.jpg" alt="image" >}}


## tl;dr

- facebook research から提供されている学習済み言語判定モデルを利用
- 新しめの軽量 python web application framework の FastAPI を利用してAPIとして公開
- [GitHub repo](https://github.com/sobamchan/lang-identify-api)

---

## 背景

現在，暇つぶしで [Pocket](https://getpocket.com/) 的なブックマークウェブアプリを開発しています．
今，ブックマークとして最低限必要な機能 (保存，アーカイブ，タグ) の実装は完了しており，
これから NLP を用いて，少し賢い機能を追加していこうと思っています．
考えている例としては，保存した記事の要約を出してみたり，タグの自動付与があります．

自分の快適な記事漁りのために，このアプリを開発しているので，自分のユースケースを考えるのは重要です．
多くのエンジニアがそうであるように，自分もまた，日常的に日本語で書かれた記事はもちろんですが，英語で書かれたものもたくさん読みます．
なので，今実際に自分で作ったアプリに記事をブックマークしているところ，英語と日本語の記事が半々くらいたまっています．

ここで，先ほどあげた便利機能を実装しようとすると問題が起きます．
NLP を行う機械学習の多くの方法では，言語ごとにモデルを用意する必要があり，
処理対象としている記事が何語で書かれているか判定するロジックを入れなくてはいけません．

今回は，この問題を解決するために [fasttext の言語判定モデル](https://fasttext.cc/docs/en/language-identification.html)
を利用し，
ウェブアプリケーションフレームワークの一つである，[FastAPI](https://fastapi.tiangolo.com/) で HTTP からアクセスできる Web API として
公開するところまでやってみようと思います．


---

## 言語判定モデル

まず，言語判定モデルの導入をしていきます．
言語判定研究は活発で，いくつかの手法が提案されていますが，今回は Facebook Research から提案された [fastText](https://fasttext.cc/) を利用します．
この選択の理由としては，

- Python から簡単に利用可能
- 判定に必要なモデルファイルが比較的軽量 (917kB)

があります．

利用方法は非常に簡単で， まず，
`pip install fasttext` でライブラリをインストールし，[ここ](https://fasttext.cc/docs/en/language-identification.html)に置いてあるリンクから
学習済みモデルをダウンロードしておきます．

あとは，Python から
```python3
from fasttext import load_model
model = load_model("./lid.176.ftz")  # ダウンロードしてきたモデルへのパスを指定．

model.predict("こんにちは，世界！")  # -> (('__label__ja',), array([0.81698149]))
```
てな感じで簡単に，言語の判定をすることができます．

以降，このロジックの呼び出しを簡単にするために，関数にしておきます．

```python3
model = load_model("./lid.176.ftz")
LANGS = ("ja", "en", "es")

def predict_lang(t: str) -> str:
    preds = model.predict(t)
    pred_langs = [p.replace("__label__", "") for p in preds[0]]
    for lang in pred_langs:  # LANGS 中の言語を優先的に選ばせたい．
        if lang in LANGS:
            return lang
    return LANGS[0]  # もし，ja, en, es 以外がきたら ja を返しちゃう
```

---

## Web API

Python には Web API を作成するためのライブラリがたくさんあり，これまで自分は Flask を機械学習モデルをデプロイするためによく利用してきました．
が，同じものばかり使っていてはつまらないし，早いという噂を聞いていたので，今回は [FastAPI](https://fastapi.tiangolo.com/) を利用していきます．
なお，本記事では API ライブラリのベンチマーキングは行いませんが，[ここ](https://www.techempower.com/benchmarks/#section=test&runid=7464e520-0dc2-473d-bd34-dbdfd7e85911&hw=ph&test=query&l=zijzen-7) にまとめられています．(よく分からんが FastAPI 早そうな感じある)

### インストール

```sh
pip install fastapi uvicorn
```

### 実装

```python3
from fastapi import FastAPI, Body, Header, HTTPException

# ...

app = FastAPI()  # アプリのインスタンスを初期化
AUTH_KEY = "SECRET_KEY"  # 雑に認証トークンを用意

@app.post("/identify")  # Routing
def identify(
        text: str = Body(..., embed=True), Authorization: str = Header(None)  # Body, Header を受け取る
        ):

    if Authorization != AUTH_KEY:  # 認証トークンが正しいかチェック
        raise HTTPException(status_code=401, detail="wrong authorization key")

    return {"lang": predict_lang(text)}  # 言語判定結果を返す
```

### 検証

```bash
pipenv run uvicorn main:app --reload --port 8003 
```
と，アプリを起動してから，

```sh
curl --location --request POST 'http://127.0.0.1:8003/identify' \
--header 'Authorization: secret' \
--header 'Content-Type: application/json' \
--data-raw '{ "text": "ウェーイ" }'
```
のように API を叩いてみると，，，

```json
{"lang":"ja"}
```

と正しい判定結果が返ってくることがわかります．

---

## まとめ

fastText と FastAPI を使って，fast に言語判定 API を簡単に作成してみました．
[sobamchan/lang-identify-api](https://github.com/sobamchan/lang-identify-api) に，コードの全体を置いておきました．

言語判定が完了して，実際に記事を分類したり，要約したりすることができるので，それらの機能の実装にこれから入っていこうと思います．
できれば，その辺の機能のことも記事にしたい．

---

### 参考文献

- https://fastapi.tiangolo.com/
- https://fasttext.cc/docs/en/language-identification.html
