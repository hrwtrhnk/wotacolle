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




## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|icon|string||
|cover|string||
|introduction|text||

### Association
- has_many :items
- has_many :comments


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|caption|text||
|user_id|references|foreign_key: true|

### Association
- belongs_to :user
- has_many :comments


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item