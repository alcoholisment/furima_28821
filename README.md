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

| Column     | Type   | Options      |
| ---------- | ------ | ------------ |
| nickname   | string | null: false  |
| email      | string | null: false  |
| password   | string | null: false  |
| first_name | string | null: false  |
| last_name  | string | null: false  |
| birthday   | date   | null: false  |

### Association

- has_many :items

## items テーブル

| Column              | Type       | Options      |
| ------------------- | ---------- | ------------ |
| image               | text       | null:false   |
| info                | text       | null:false   |
| category            | integer    | null:false   |
| sales-status        | integer    | null:false   |
| shipping-fee-status | integer    | null:false   |
| prefecture          | integer    | null:false   |
| scheduled-delivery  | integer    | null:false   |
| price               | string     | null:false   |

### Association

- has_many :comments
- has_one :buy

## buy テーブル

| Colomn         | Type       | Options    |
| -------------- | ---------- | ---------- |
| card-number    | string     | null:false |
| card-exp-month | string     | null:false |
| card-exp-year  | string     | null:false |
| card-cvc       | string     | null:false |
| postal-code    | string     | null:false |
| prefecture     | references | null:false |
| city           | string     | null:false |
| addresses      | string     | null:false |
| building       | string     |            |
| phone-number   | string     | null:false |

## comments テーブル

| Colomn  | Type       | Options    |
| ------- | ---------- | ---------- |
| text    | text       | null:false |
| user_id | references |            |