class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :prefecture
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :ship_from_area
  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :explanation
    validates :image
    validates :price,inclusion: { in: 300..9999999 },numericality: {only_integer: true}
  end
  with_options numericality: { other_than: 1} do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :ship_from_area_id
    validates :prefecture_id
  end
end
