# shiori

` shioriは「本の一節の引用」とそれに対する「ユーザー読者の意見」によるSNSアプリです。 `


<br>

_〜ただいま全力で実装中！〜_

<br>
<br>

<!-- **URL:**

| テストアカウント |   |
| ------------- | - |
| nickname | shiori |
| password | 1q84book |

# how to use?

解決課題 -->

# shioriのテーブル設計図

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
| author | string |null: false |
| publish | string | null:false |
| year | integer | |
| page | integer | null: false |
| text | text |null: false |
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