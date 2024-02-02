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
| nickname          | string | null: false, unique: true|
| email             | string | null: false, unique: true|
| encrypted_password| string | null: false              |
| last_name         | string | null: false              |
| first_name        | string | null: false              |
| birth_year        | integer| null: false              |
| birth_month       | integer| null: false              |
| birth_date        | integer| null: false              |

### Association

- has_many :items
- has_many :Purchases   

## items テーブル

| Column----------| Type------| Options------------------|
| ----------------| ----------| -------------------------|
| title           | string    | null: false              |
| price           | integer   | null: false              |
| category        | string    | null: false              |
| condition       | text      | null: false              |
| shipping_cost   | integer   | null: false              |
| region_origin   | string    | null: false              |
| item_information| text      | null: false              |
| item_user_id    | references| null: false              |

### Association

- belongs_to :users
- has_one :Purchases 

## Purchases テーブル

| Column----------| Type------| Options---------------------|
| ----------------| ----------| ----------------------------|
| purchase_user_id| references| null: false,foreign_key:true|
| item_id         | references| null: false,foreign_key:true|

### Association

- belongs_to :users
- belongs_to :items
- has_one :Shippings


## Shippings テーブル

| Column--------| Type---| Options----|
| --------------| -------| -----------|
| address_number| integer| null: false|
| prefecture    | string | null: false|
| city          | string | null: false|
| street_number | integer| null: false|
| building_name | text   |            |
| phone_number  | integer| null: false|
| purchase_id   | integer| null: false|

### Association

- belongs_to :Purchases
