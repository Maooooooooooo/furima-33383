class Item < ApplicationRecord
  extend ActiveHash: :Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :prefecture
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :ship_from_area
  has_one_attached :image

  validates :item_name,presence: true
  validates :explanation,presence: true
  validates :category_id, numericality: { other_than: 1}
  validates :condition_id, numericality: { other_than: 1}
  validates :delivery_fee_id, numericality: { other_than: 1}
  validates :ship_from_area_id, numericality: { other_than: 1}
  validates :prefecture_id, numericality: { other_than: 1}
  validates :price,presence: true
  validates :image, presence: true
end
