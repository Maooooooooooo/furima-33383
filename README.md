### users テーブル

| Column          | Type   | Options                  |
| ----------------| ------ | -------------------------|
| nickname        | string | null: false              |
| email           | string | null: false,unique: true |
| password        | string | null: false              |
| first_name      | string | null: false              |
| last_name       | string | null: false              |
| first_name_kana | string | null: false              |
| last_name_kana  | string | null: false              |
| birth_day       | date   | null: false              |

### Association
- has many :items

### items テーブル

| Column          | Type          | Options                        |
| ----------------| ------------- | -------------------------------|
| item-name       | string        | null: false                    |
| category        | string        | null: false                    |
| price           | integer       | null: false                    |
| image           | ActiveStorage |                                |
| user            | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- has one :purchase

### purchases テーブル

| Column          | Type          | Options                        |
| ----------------| ------------- | -------------------------------|
| purchase-name   | string        | null: false                    |
| item            | references    | null: false, foreign_key: true |

### Association
- belongs to :item
- has one :ship

### ships テーブル

| Column          | Type          | Options                        |
| ----------------| ------------- | -------------------------------|
| purchase        | references    | null: false, foreign_key: true |
| postal_cord     | integer       | null: false                    |
| prefecture      | string        | null: false                    |
| city            | string        | null: false                    |
| word            | string        | null: false                    |
| phone_number    | integer       | null: false                    |

### Association
- belongs to :purchase