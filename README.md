# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column          | Type   | Options      |
| --------------- | ------ | ------------ |
| nickname        | string | null: false  |
| email           | string | null: false  |
| password        | string | null: false  |
| first-name      | string | null: false  |
| last-name       | string | null: false  |
| first-name-kana | string | null: false  |
| last-name-kana  | string | null: false  |
| birthday        | date   | null: false  |

### Association

- has_many :items
- has_many :orders
- has_many :comments
- has_one :shipping

## items テーブル

| Column              | Type       | Options                      |
| ------------------- | ---------- | ---------------------------- |
| name                | string     | null:false                   |
| image               | string     | null:false                   |
| info                | text       | null:false                   |
| category            | integer    | null:false                   |
| sales-status        | integer    | null:false                   |
| shipping-fee-status | integer    | null:false                   |
| prefecture          | integer    | null:false                   |
| scheduled-delivery  | integer    | null:false                   |
| price               | integer    | null:false                   |
| user                | references | null:false foreign_key: true |


### Association

- has_many :comments
- has_one :shipping
- has_one :order
- belongs_to :user

## shippings テーブル

| Colomn         | Type       | Options                      |
| -------------- | ---------- | ---------------------------- |
| prefecture     | integer    | null:false                   |
| postal-code    | string     | null:false                   |
| city           | string     | null:false                   |
| address        | string     | null:false                   |
| building       | string     |                              |
| phone-number   | string     | null:false                   |
| order          | references | null:false foreign_key: true |

### Association

- belongs_to :order

## orders テーブル

| Colomn   | Type       | Options                      |
| -------- | ---------- | ---------------------------- |
| item     | references | null:false foreign_key: true |
| user     | references | null:false foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :shipping

## comments テーブル

| Colomn  | Type       | Options                      |
| ------- | ---------- | ---------------------------- |
| text    | text       | null:false                   |
| user    | references | null:false                   |
| item    | references | null:false foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user