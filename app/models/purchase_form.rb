class PurchaseForm
  include ActiveModel::Model


  attr_accessor :user_id, :item_id, :postal_cord, :prefecture_id, :city, :word, :building, :phone_number, :token
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_cord,format: { with:/\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :word
    validates :phone_number,format: { with:/\A\d{11}\z/ }
    validates :token
  end


  def save
    Purchase.create(purchase: purchase)
    Ship.create(ship: ship)
  end
end