### users テーブル

| Column             | Type   | Options                  |
| -------------------| ------ | -------------------------|
| nickname           | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | devise | null: false              |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| first_name_kana    | string | null: false              |
| last_name_kana     | string | null: false              |
| birth_day          | date   | null: false              |

### Association
- has many :items
- has many :purchase

### items テーブル

| Column              | Type          | Options                        |
| ------------------- | ------------- | -------------------------------|
| item-name           | string        | null: false                    |
| explanation         | text          | null: false                    |
| category_id         | integer       | null: false                    |
| condition_id        ｜ integer      | null: false                     |
| delivery_fee_id     | integer       | null: false                    | 
| ship_from_area_id   | integer       | null: false                    |
| shipping_day_id     | integer       | null: false                    |
| price               | integer       | null: false                    |
| image               | ActiveStorage |                                |
| user                | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- has one :purchase

### purchases テーブル

| Column          | Type          | Options                        |
| ----------------| ------------- | -------------------------------|
| user            | references    | null: false, foreign_key:true  |
| item            | references    | null: false, foreign_key: true |

### Association
- belongs to :item
- belongs to :user
- has one :ship

### ships テーブル

| Column          | Type          | Options                        |
| ----------------| ------------- | -------------------------------|
| purchase        | references    | null: false, foreign_key: true |
| postal_cord     | integer       | null: false                    |
| prefecture      | string        | null: false                    |
| city            | string        | null: false                    |
| word            | string        | null: false                    |
| building        | string        |                                |
| phone_number    | integer       | null: false                    |

### Association
- belongs to :purchase