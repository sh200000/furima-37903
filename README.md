# テーブル設計

## users テーブル

| Column             | Type         | Options                        |
| ------------------ | ------       | -----------                    |
| name               | string       | null: false                    |
| email              | string       | null: false, unique: true      |
| encrypted_password | string       | null: false                    |
| last_name          | string       | null: false                    |
| first_name         | string       | null: false                    |
| last_name_kana     | string       | null: false                    |
| first_name_kana    | string       | null: false                    |
| birthday           | date         | null: false                    |

### Association

- has_many   :items
- has_many   :orders

## items テーブル

| Column            | Type         | Options                        |
| ------            | ------       | -----------                    |
| name              | string       | null: false                    |
| content           | text         | null: false                    |
| category_id       | integer      | null: false                    |
| condition_id      | integer      | null: false                    |
| shipping_charge_id| integer      | null: false                    |
| prefecture_id     | integer      | null: false                    |
| shipping_day_id   | integer      | null: false                    |
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


### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping

## shippings テーブル

| Column       | Type       | Options                        |
| ------       | ---------- | ------------------------------ |
| post_code    | string     | null: false                    |
| prefecture_id| integer    | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| telephone    | string     | null: false                    |
| order        | references | null: false, foreign_key: true |

### Association

- belongs_to :order
- belongs_to :prefecture

