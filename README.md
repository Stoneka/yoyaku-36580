# テーブル設計

## customers テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |
| phone              | string  | null: false               |

### Association

- has_many :reserves
- has_one :cart

## items テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ------------|
| item_name   | string     | null: false |
| explanation | text       | null: false |
| size_id     | integer    | null: false |
| price       | integer    | null: false |
| calorie     | integer    | null: false |
| protein     | integer    | null: false |
| fat         | integer    | null: false |
| salt        | integer    | null: false |
| carb        | integer    | null: false |

### Association

- has_many :reserves

## reserves テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| quantity  | integer    | null: false                    |
| message   | text       | null: false                    |
| honorific | string     | null: false                    |
| case      | string     | null: false                    |
| customer  | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
| cart      | references | null: false, foreign_key: true |

### Association

- belongs_to :customer
- belongs_to :item
- belongs_to :cart
- has_one :order

## orders テーブル

| Column  | Type       | Options                        |
| --------| ---------- | ------------------------------ |
| reserve | references | null: false, foreign_key: true |

### Association

- belongs_to :reserve
- has_one :request

## requests テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| visit_date    | date       | null: false                    |
| visit_time_id | integer    | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## carts テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| customer     | references | null: false, foreign_key: true |

### Association

- belongs_to :customer
- has_many :reserves
