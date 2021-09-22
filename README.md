# Yoyaku

# 概要
## https://yoyaku-36580.herokuapp.com/

予約管理システムです。  
店舗スタッフがシステムを管理・運用することができます。  
また、商品管理機能を搭載しているので、細かなメンテナンスを行うことが出来ます。  
このシステムを導入することで業務の効率化が期待できます。  

# テストアカウント
ユーザーアカウント
- メールアドレス  
  user@master.jp
- パスワード  
  00000a  

カスタマーアカウント
- メールアドレス  
  test1@test
- パスワード  
  00000a

Basic認証
- ユーザー名  
  original
- パスワード  
  id36580

# 機能
## ユーザー
- カスタマーに予約された商品を確認
- 登録されている商品を確認
- 商品を新たに登録
- 登録された商品情報を編集・削除
## カスタマー
- 会員登録、ログイン、ログアウト
## 予約
- カスタマーは商品の予約・購入が可能
## カート
- カスタマーは購入前の商品をカートで確認が可能

# 解決したい課題
## 飲食店における予約業務にかかる手間や負担を減らすこと  
- パティスリーでの導入を想定  
- 商品は店舗での受け取り  
## カスタマーに対し、より良いサービスを提供すること
- 営業時間外での予約を受付

# 要件定義
| 機能        | 目的                                      |
| ----------- | ---------------------------------------- |
| 予約管理     | ユーザーが予約された商品とカスタマーを確認      |
| 商品管理     | ユーザーが登録した商品を管理                  |
| 商品新規登録  | ユーザーが販売したい商品を登録                |
| 商品情報編集  | ユーザーが登録した商品情報を編集              |
| 商品情報削除  | ユーザーが登録した商品情報を削除              |
| 商品一覧表示  | カスタマーがどんな商品が販売されているか確認    |
| 商品詳細     | カスタマーが商品の詳細を確認                  |
| 会員登録     | ユーザーの顧客管理とカスタマーの利便性向上      |
| 予約注文     | カスタマーが商品を予約                       |
| クレジットカード決済  | カスタマーがクレジットカードで商品を購入 |

# 仕様
## macOS BigSur11.4
## Ruby 2.6.5
## Ruby on Rails 6.0.4.
## Heroku
## PAY.JP

# テーブル設計

## customers テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
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
| use_case  | string     | null: false                    |
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
