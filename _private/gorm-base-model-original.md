---
title: "gorm.Modelを自分好みの定義にする．"
date: 2020-03-18T08:02:05+09:00
draft: false
toc: false
images:
  - /imgs/gorm-base-header.jpg
tags: 
  - golang
  - gorm
  - web
---

{{< figure src="/imgs/gorm-base-header.jpg" alt="image" >}}

## tl;dr
- gorm殻提供されている基本モデルを自分の好みに書き直す．


## 概要

最近，golangを使って簡単なWebアプリを作ろうとしており，横着して実装を進めながら勉強しています．  
Webアプリを作ろうとした時，いくつかあるベースとなるコンポーネントのうち特に重要なのがデータベースだと思います．

Webアプリを作る際には，[ORM](https://ja.wikipedia.org/wiki/%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E9%96%A2%E4%BF%82%E3%83%9E%E3%83%83%E3%83%94%E3%83%B3%E3%82%B0)
を使ってデータハンドリングをしたいですよね．
そして，golangでORMを検索すると，まず[gorm](http://gorm.io/)に行き着くと思います． 今回自分もこれを採用しました．


[Quick Start](http://gorm.io/docs/#Quick-Start)を見てみると，以下のようにモデルの定義をしています．

```go
package main

import (
  "github.com/jinzhu/gorm"
  _ "github.com/jinzhu/gorm/dialects/sqlite"
)

type Product struct {
  gorm.Model
  Code string
  Price uint
}
```

`Product`というモデルを定義する際に`gorm.Model`という構造体を埋め込んでいます，このAPIを[ドキュメント](https://pkg.go.dev/github.com/jinzhu/gorm?tab=doc#Model)で見てみると．

```go
type Model struct {
	ID        uint `gorm:"primary_key"`
	CreatedAt time.Time
	UpdatedAt time.Time
	DeletedAt *time.Time `sql:"index"`
}
```

Web開発でまず必要な情報を提供しているみたいです．primary keyとしてidってのはほとんどの場合で必要なので便利ですね．
しかし，ここで小さな問題にぶつかります．

gorm内でこの構造体が定義されているため，例えばDBから検索してきた結果を，JSONに変換した際に
`ID`フィールドがJSONでも`ID`という名前になってしまいます．が，一般的に小文字で`id`としたいことの方が多いです．

```go
json.Marshal(one_product)  // -> {"ID": 1, "CreatedAt": ...}
```

`CreatedAt`も`created_at`になって欲しいですよね．



## 解決

これを解決するために，`gorm.Model`を上書きする用法を調べていたのですが，[gorm GitHub Issueのコメント](https://github.com/jinzhu/gorm/issues/2681#issuecomment-536118464)で
「嫌なら使わないで，自分で定義すればいいじゃん」ってのがあってそれで解決しました．

```go
type MyBaseModel struct {
  ID        uint       `gorm:"primary_key" json:"id"`
  CreatedAt time.Time  `json:"created_at"`
  UpdatedAt time.Time  `json:"updated_at"`
  DeletedAt *time.Time `json:"deleted_at"`
}

type Product struct {
  MyBaseModel
  Code string
  Price uint
}
```

こうすることで，`json.Marshal(one_product)`したときに，JSON内の`ID`だったところが`id`になってくれます．
`CreatedAt`，`UpdatedAt`，`DeletedAt`も`gorm.Model`を使用していた時と同様に，自動でgormが更新してくれます．


---

### 参考
- [gorm.io](http://gorm.io/)
- [Go by Example: JSON](https://gobyexample.com/json)
- [can you change the gorm.Model definition？](https://github.com/jinzhu/gorm/issues/2681#issuecomment-536118464)
