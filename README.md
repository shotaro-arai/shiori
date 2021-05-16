# shiori

` shioriは「本の一節の引用」とそれに対する「ユーザー読者の意見」によるSNSアプリです。 `


<br>

_〜ただいまデプロイ中！〜_

[![Image from Gyazo](https://i.gyazo.com/4167df72398c9f30b9d271425c428846.gif)](https://gyazo.com/4167df72398c9f30b9d271425c428846)

<br>
<br>

# Who?
<br>

 ペルソナ =>

_本が大好き！活字中毒。。<br>
でもインプットがメイン<br>
この本の感動を伝えることのできる人がいたらなぁ。。<br>
この本で学んだ知識や気づきを誰かに話したい！_<br>
<br>
**そんなあなたへ**

<br>
<br>


**URL** <br>
https://shiori-210429.herokuapp.com/

<br>
<br>

| テストアカウント |   |
| ------------- | - |
| nickname | shiori |
| password | 1q84book |

<br>
<br>



# how to use ? 
<br>

- ユーザー登録 / ログイン機能
- 新規投稿機能
- 画像投稿機能
- コメント機能
- ユーザー編集機能
- 検索機能
- ジャンル機能
<br>

**今後実装予定！**


- アカウント削除機能
- いいね機能
- プレビュー機能

<br>

_ユーザーログイン画面_

[![Image from Gyazo](https://i.gyazo.com/85f281f9d219c2d5ccc643ffb296a6af.gif)](https://gyazo.com/85f281f9d219c2d5ccc643ffb296a6af)

<br>
<br>

# Why ?

本は知識、知識は人々の資産です。<br>
少しDeepな内容を、気軽にTweetして<br>
読者同士のコミュニケーションツールに<br>
そしてあなたの今日のアウトプットに<br>
<br>
投稿はマイページであなたの本棚に<br>
いつでも栞をはさんだページに戻れます



<br>
<br>
<br>
<br>

# What ?
# テーブル設計図

<br>
<br>

## usersテーブル 

| column | type | options |
| ------ | ---- | ------- |
| nickname | string | null: false |
| email | string | null: false |
| password | string | null: false |
| encrypted_password | string | null: false |

<br>

### _association_
has_one :profile <br>
has_many :books <br>
has_many :comments <br>
has_many :likes

<br>
<br>

## profilesテーブル

| column | type | options |
| ------ | ---- | ------- |
| text | text | null: false |
| age | string | |
| sex | string | |
| job | string | |
| user_id | references | null: false, optional: true |

<br>

### _association_
belongs_to :user

<br>
<br>

## booksテーブル

| column | type | options |
| ------ | ---- | ------- |
| quote | text | null: false |
| title | string | null: false |
| title_option | string | |
| author | string |null: false |
| publish | string | null:false |
| year | integer | null:false |
| page | integer | null: false |
| text | text |null: false |
| genre_id | integer | null: false | 
| user_id | references | null: false, foreign_key: true |

<br>

### _association_
belongs_to :user <br>
has_many :comments <br>
has_many :likes <br>
has_many :tags, through: book_tags

<br>
<br>

## commentsテーブル

| column | type | options |
| ------ | ---- | ------- |
| text | text | null: false |
| user_id | references | null: false, foreign_key: true |
| book_id | references | null: false, foreign_key: true |

<br>

### _association_
belongs_to :user <br>
belongs_to :book

<br>
<br>

## likesテーブル

| column | type | options |
| ------ | ---- | ------- |
| user_id | references | null: false, foreign_key: true |
| book_id | references | null: false, foreign_key: true |

<br>

### _association_
belongs_to :user <br>
belongs_to :book

<br>
<br>

## tagsテーブル

| column | type | options |
| ------ | ---- | ------- |
| name | string | |

<br>

### _association_
has_many :books, through: book_tags

<br>
<br>

## book_tagsテーブル

| column | type | options |
| ------ | ---- | ------- |
| book_id | references | null: false, foreign_key: true |
| tag_id | references | null: false, foreign_key: true |

<br>

### _association_
belongs_to :book <br>
belongs_to :tag

<br>
<br>

# ER図

[![Image from Gyazo](https://i.gyazo.com/526f75773f5376b8cfd649e397cff2ed.png)](https://gyazo.com/526f75773f5376b8cfd649e397cff2ed)

<br>
<br>

# 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/e49e73bb6c891cb9ed0325292b50d778.png)](https://gyazo.com/e49e73bb6c891cb9ed0325292b50d778)

<br>
<br>

# 環境

フレームワーク => ruby on rails ver.6.0.0<br>
言語 => html, css, ruby<br>
データベース => mySQL<br>
その他 => GitHub, Heroku<br>