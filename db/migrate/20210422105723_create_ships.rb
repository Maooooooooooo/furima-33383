class CreateShips < ActiveRecord::Migration[6.0]
  def change
    create_table :ships do |t|
      t.references :purchase,foreign_key: true
      t.integer :postal_cord,null: false
      t.integer :prefecture_id,null: false
      t.string :city,null: false
      t.string :word,null: false
      t.integer :phone_number,null: false 
      t.timestamps
    end
  end
end
