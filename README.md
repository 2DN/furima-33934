


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
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association

-belongs_to :purchase
---activeHash---
belongs_to :prefecture
------end-------


