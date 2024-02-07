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
## users テーブル

| Column------------| Type---| Options------------------|
| ------------------| -------| -------------------------|
| nickname          | string | null: false              |
| email             | string | null: false, unique: true|
| encrypted_password| string | null: false              |
| last_name         | string | null: false              |
| first_name        | string | null: false              |
| last_name_kana    | string | null: false              |
| first_name_kana   | string | null: false              |
| birth_date        | date   | null: false              |

### Association

- has_many :items
- has_many :purchases   

## items テーブル

| Column----------| Type------| Options---------------------|
| ----------------| ----------| ----------------------------|
| title           | string    | null: false                 |
| price           | integer   | null: false                 |
| category_id     | integer   | null: false                 |
| condition_id    | integer   | null: false                 |
| shipping_cost_id| integer   | null: false                 |
| shipping_date_id| integer   | null: false                 |
| region_id       | integer   | null: false                 |
| item_information| text      | null: false                 |
| user            | references| null: false,foreign_key:true|

### Association

- belongs_to :user
- has_one :purchase 

## Purchases テーブル

| Column| Type------| Options---------------------|
| ------| ----------| ----------------------------|
| user  | references| null: false,foreign_key:true|
| item  | references| null: false,foreign_key:true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping


## Shippings テーブル

| Column--------| Type-----| Options---------------------|
| --------------| ---------| ----------------------------|
| address_number| string   | null: false                 |
| region_id     | integer  | null: false                 |
| city          | string   | null: false                 |
| street_number | string   | null: false                 |
| building_name | string   |                             |
| phone_number  | string   | null: false                 |
| purchase      | reference| null: false,foreign_key:true|

### Association

- belongs_to :purchase
