---
title: Go; ネストした json の一部のデータを取り出す
updated: 2020-10-03
---


```go
package main

import (
	"encoding/json"
	"fmt"
)

func main() {
	var jsonBlob = []byte(`
    {"Name": "Hoge", "Data": {"Age": 20, "Address": "Tokyo"}}
`)

	var data map[string]interface{}
	err := json.Unmarshal(jsonBlob, &data)
	if err != nil {
		fmt.Println("error:", err)
	}

	fmt.Printf("%+v", data["Data"].(map[string]interface{})["Age"])
}
```

https://golang.org/pkg/encoding/json/#Unmarshal
https://kwmt27.net/index.php/2013/10/13/how-to-convert-from-map-to-struct/
https://qiita.com/someone7140/items/06159652a000e08e06ec
https://qiita.com/nayuneko/items/2ec20ba69804e8bf7ca3
