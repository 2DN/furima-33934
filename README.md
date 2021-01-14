# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| :----------------- | :----- | :---------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name_kanji    | string | null: false |
| first_name_kanji   | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| date_of_birth      | date   | null: false |

### Association

-has_many :items
-has_many :purchases


## items テーブル

| Column          | Type       | Options                        |
| :-------------- | :--------- | :----------------------------- |
| name            | string     | null: false                    |
| description     | text       | null: false                    |    
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| days_taken_id   | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-has_one :purchase
----activeHash----
-belongs_to :category
-belongs_to :condition
-belongs_to :delivery_fee
-belongs_to :comes_from
-belongs_to :days_taken
-------end--------


## orders テーブル

| Column     | Type       | Options                        |
| :--------- | :--------- | :----------------------------- |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item
-has_one :address


## shipping_addresses テーブル

| Column        | Type       | Options                        |
| :-------------| :--------- | :----------------------------- |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| areas         | string     | null: false                    |
| block_number  | integer    | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association

-belongs_to :purchases
---activeHash---
belongs_to :prefecture
------end-------

