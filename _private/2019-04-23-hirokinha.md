---
title: hirokinha
updated: 2019-04-23 09:50
---

やとうとしてた
* 学費延納書類提出
* p0 serverでの実行環境の整備
* event2vec step2 の全データでの動作確認
* buildit eventのスライド作成


やった


できなかった


あした


その他


event2vecで使用していたdatasetはgpu0に設置していたが
複数マシンから見れるようにするために、public:~/B4/takeshita/DATA/NLP/event2vec以下に置いた。


Dを学習した際のvocと、step2で作成しているvocにサイズの差があるかもしれない -> 全然一致しない step2がでかい
step1.vocは単語の集合 step2.vocはevent ids
step1のtrainではdoc_nはlen(dataset)
つまり
step2.vocから特殊文字列 <pad> とかを削除すればちょうど数が一致する
(pad, unk, s, /s, none)


変な手順になってしまうが、
1. step2のdataset生成をして
2. それのvocab (for eventid)を使用して、
3. step1のdatasetの生成をする。 ここでpostprocess内で2を使用してeventidを置換するようにする。


これの実装は完了している。


夜はヒロキが日本に来ているので新宿まで会いに行ってきた。
ユウキとハイロ、ゆかで新宿にあるお好み焼き食べ飲み放題に行った。
