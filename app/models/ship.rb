class Ship < ApplicationRecord
  belongs to :purchase
  with_options presence: true do
    validates :postal_cord
    validates :prefecture_id,numericality: { other_than: 1}
    validates :city
    validates :word
    validates :phone_number
  end
end
