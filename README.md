# テーブル設計

## users テーブル

| Column             | Type         | Options                        |
| ------------------ | ------       | -----------                    |
| name               | string       | null: false                    |
| email              | string       | null: false                    |
| encrypted_password | string       | null: false                    |
| last_name          | string       | null: false                    |
| first_name         | string       | null: false                    |
| last_name_kana     | string       | null: false                    |
| first_name_kana    | string       | null: false                    |
| birth_year         | references   | null: false, foreign_key: true |
| birth_month        | references   | null: false, foreign_key: true |
| birth_day          | references   | null: false, foreign_key: true |


### Association

- has_many   :items
- has_many   :orders
- belongs_to :birth_year
- belongs_to :birth_month
- belongs_to :birth_day

## items テーブル

| Column            | Type         | Options                        |
| ------            | ------       | -----------                    |
| name              | string       | null: false                    |
| content           | text         | null: false                    |
| category          | references   | null: false, foreign_key: true |
| condition         | references   | null: false, foreign_key: true |
| shipping_charge   | references   | null: false, foreign_key: true |
| prefecture        | references   | null: false, foreign_key: true |
| shipping_day      | references   | null: false, foreign_key: true |
| price             | integer      | null: false                    |
| user              | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :category
- belongs_to :condition
- belongs_to :shipping_charge
- belongs_to :prefecture
- belongs_to :shipping_day
- has_one    :order

## orders テーブル

| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |
| post_code   | integer    | null: false                    |
| prefecture  | references | null: false, foreign_key: true |
| city        | string     | null: false                    |
| address     | string     | null: false                    |
| building    | string     |                                |
| telephone   | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :prefecture

