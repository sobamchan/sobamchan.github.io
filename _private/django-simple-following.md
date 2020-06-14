---
title: "Djangoで簡単なフォロー機能を実装してみる"
date: 2017-01-29T09:24:24+09:00
draft: false
toc: false
images:
tags: 
  - python
  - django
  - web
---

[Qiitaのアカウント削除のために，移動してきました．]


## 経緯
Djangoでユーザー間のフォロー機能を作成しそうなものがあるので、
どのようにするのがシンプルか考えてみた。

## やること
- django.contrib.auth.modelsのUserモデルを拡張してインスタンスメソッドを追加する
- RelationshipモデルをUserの中間テーブルとして作成し、フォロー管理をする

## 使うパッケージ
- Django==1.9.7

## ソースコード
は[ここにあります](https://github.com/oh-sore-takesou/django-simple-relationship)   

snsプロジェクトとuserアプリを作成しています。   
実際に編集しているのは`user/models.py`のみで、以下のようになっています。

```py3
from django.db import models
from django.contrib.auth.models import User as DjangoUser

'''
DjangoのデフォルトUserモデルを継承して、インスタンスメソッドを追加している
'''
class User(DjangoUser):

    '''
    新規にtableを作成せずに継承したmodelの拡張のみを行いたいので、
    MetaクラスのproxyをTrueにしている。
    '''
    class Meta:
        proxy = True

    '''
    Userインスタンスがフォローしているuserを返す関数
    '''
    def get_followers(self):
        relations = Relationship.objects.filter(follow=self)
        return [relation.follower for relation in relations]
        


'''
フォローしている人と、フォローされている人をつなぐ中間テーブル
'''
class Relationship(models.Model):
    follow = models.ForeignKey(User, related_name='follows')
    follower = models.ForeignKey(User, related_name='followers')
```

DjangoのUserモデルを拡張したい場合にはMetaクラスをいじる必要があるのがミソな気がします。[ここ](https://simpleisbetterthancomplex.com/tutorial/2016/07/22/how-to-extend-django-user-model.html)に詳しく書いてあります。
Relationshipモデル内で`related_name`を定義していますが現段階では必要ありません。


## 感想
フォロー機能を追加するには様々な方法があると思うんですが、今回は自分が取れる一番シンプルそうな、方法を取ってみました。  
他にもっといい方法が必ずあると思うんですが、まあdjangoのuserモデルを拡張する方法を調べれたので満足しています。
これよりもいい感じの方法をご存知の方おられましたら是非教えていただきたいです。  

[twitter始めました](https://twitter.com/sobamchan)
