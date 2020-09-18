# README

# テーブル設計


## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| profile        | text   |             |
| image          | string |             |

### Association

- has_many :contents
- has_one_attached :image


## contents テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| title  | string     | null: false                    |
| note   | text       | null: false                    |
| image  | string     | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one_attached :image