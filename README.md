# README

# Error Collection

# 概要
開発中エラー画面の投稿アプリケーション

# アプリケーションURL
https://final-app28816.herokuapp.com

# 利用方法
アプリケーション開発中に発生するエラー画面を投稿・記録し、エラーが再発した場合に早期対応を可能とすることができるアプリケーションです。

# 目指した課題解決
私は開発中はエラー画面との戦いであり、如何に早期エラー解決することが大切かを学びました。
そのエラー画面のみの記録が一箇所にまとめてあれば、多くの開発者が簡単にエラー解決の糸口を掴めるのでないかと考えました。

# 洗い出した要件
#### ユーザー登録機能
・ユーザーは未ログイン状態でコンテンツの閲覧が可能
・登録ユーザーは一覧表示して閲覧が可能
#### 画像とテキストの投稿機能
・投稿はログイン状態であれば可能
・投稿内容には解説文の記載が可能
・投稿内容は編集・削除機能が可能
#### 投稿内容の検索機能
・コンテンツの検索はログインせずに検索可能
・キーワードを検索バーに入力し、キーワードが含まれた投稿を一覧表示できる

# 実装した機能の参考GIF
各機能のビューが存在します。
https://gyazo.com/6800de297657820dac0f127a9eff0f9e

画像とテキストの投稿が可能です。
https://gyazo.com/16b77ac6dad5f7cc36b9d7e77ed0b279

# 実装予定の機能
投稿した内容について、投稿者以外のユーザーからの質問されることが想定されるので、投稿内容についてのコメントをする機能を実装予定となっています。

# ローカルでの動作方法
git clone https://github.com/SEKalashinikov/final-app28816.git
### 開発環境
Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code

# データベース設計
## ER図
URL：https://gyazo.com/997241ab6b86cc66d1f04a957d7e7396

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