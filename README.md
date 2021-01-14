# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| :--------------- | :----- | :---------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| last_name_kanji  | string | null: false |
| first_name_kanji | string | null: false |
| last_name_kana   | string | null: false |
| first_name_kana  | string | null: false |
| date_of_birth    | date   | null: false |

### Association

-has_many :items
-has_many :purchases
-has_one :address


## items テーブル

| Column        | Type       | Options                        |
| :------------ | :--------- | :----------------------------- |
| name          | string     | null: false                    |
| description   | text       | null: false                    |    
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| delivery_fee  | boolean    | null: false                    |
| comes_from    | string     | null: false                    |
| days_taken    | integer    | null: false                    |
| price         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-has_one :purchase

## purchases テーブル

| Column     | Type       | Options                        |
| :--------- | :--------- | :----------------------------- |
| user_id    | references | null: false, foreign_key: true |
| item_id    | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item
-has_one :address


## addresses テーブル

| Column       | Type       | Options                        |
| :------------| :--------- | :----------------------------- |
| postal_code  | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| areas        | string     | null: false                    |
| block_number | integer    | null: false                    |
| building     | string     | null: false                    |
| phone_number | integer    | null: false                    |
| purchase_id  | references | null: false, foreign_key: true |
| user_id      | references | null: false, foreign_key: true |

### Association

-belongs_to :purchases

