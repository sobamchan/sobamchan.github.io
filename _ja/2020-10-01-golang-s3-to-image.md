---
title: Go; s3 の画像を取得して image.Image 型に変換する
updated: 2020-10-01
---

s3 に保存してあるファイルをダウンロードしてくるのは，[aws/aws-cli](https://github.com/aws/aws-cli/tree/v2) を使えば簡単にできる．
が，本記事ではそうではなく，s3 から画像を取得，保存 (書き出し) はせずに，golang の [`image.Image`](https://golang.org/pkg/image/#Image) 型に
押し込める方法をまとめる．  
こうすることで，s3 の画像に自身のマシンで任意の処理・変換をしてから保存 (or api server なら serve) する事ができる．

まず，aws adk を利用可能にしておく．
```go
import (
	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/s3"
	"github.com/aws/aws-sdk-go/service/s3/s3manager"
)
```

これを使って，s3 とのセッションを作成する．
```go
sess, _ := session.NewSession(&aws.Config{
	Region: aws.String("my region")},
)
```
実際には，これをする前に，2 つの環境変数，`AWS_ACCESS_KEY_ID` と `AWS_SECRET_ACCESS_KEY` を設定しておく必要がある．

これから実際に画像を取得していく．  
まず，とってきた画像を入れておくバッファを用意する．これは `aws-sdk` から良い感じのが提供されているのでそれを使う．
```go
buff := &aws.WriteAtBuffer{}
```

で，場所を指定してダウンロードしたファイルをそのバッファに書き込む．
```go
s3dl := s3manager.NewDownloader(sess)
_, err := s3dl.Download(buff, &s3.GetObjectInput{
	Bucket: aws.String(bucket),
	Key:    aws.String(path),
})
```

データを突っ込んだ `buff` には `Bytes() -> []byte` が定義されているので，
`bytes.NewReader` を使えば `Read()` が実装された構造体に変換できる．
そうなってしまえば，[`image/jpeg`](https://golang.org/pkg/image/jpeg) の `func Decode(r io.Reader)` が使えるので
元々欲しかった `image.Image` にたどり着く．  
実際にはこれら 2 つの処理を 1 行でかける．
```go
image, err = jpeg.Decode(bytes.NewReader(buff.Bytes()))
```

これでできた `image` は `image.Image` なので，以前の記事で紹介した [Goで画像にテキストを合成する方法](https://sotaro.io/ja/googp-ja) を
s3 & server で画像の保存なしで行う事ができる．

---

コード全体像を下に貼っておく．

```go
package main

import (
	"bytes"
	"image"
	"image/jpeg"
	"log"
	"os"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/s3"
	"github.com/aws/aws-sdk-go/service/s3/s3manager"
)

const bucket = "mybucket"

func getImg(imgName string) image.Image {
	path := imgName

	sess, _ := session.NewSession(&aws.Config{
		Region: aws.String("my region")},
	)

	buff := &aws.WriteAtBuffer{}

	s3dl := s3manager.NewDownloader(sess)
	_, err := s3dl.Download(buff, &s3.GetObjectInput{
		Bucket: aws.String(bucket),
		Key:    aws.String(path),
	})

	var img image.Image
	img, err = jpeg.Decode(bytes.NewReader(buff.Bytes()))
	if err != nil {
		log.Fatal(err)
	}

    // ここで適当な画像処理できる．

    // 書き出したければこんな感じ
	w, _ := os.Create("hoge.jpeg")
	jpeg.Encode(w, img, &jpeg.Options{Quality: 100})

	return img
}
```
