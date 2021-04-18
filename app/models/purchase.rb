class Purchase < ApplicationRecord
  belongs to :item
  belongs to :user
  has one :ship
end
