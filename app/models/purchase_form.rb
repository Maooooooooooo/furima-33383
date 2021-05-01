class PurchaseForm
  include ActiveModel::Model


  attr_accessor :user_id, :item_id, :postal_cord, :prefecture_id, :city, :word, :building, :phone_number, :token
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_cord,format: { with:/\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id,numericality: { other_than: 1}
    validates :city
    validates :word
    validates :phone_number,format: { with:/\A\d{11}\z/ }
    validates :token
  end


  def save
    purchase = Purchase.create(user_id: user_id,item_id: item_id)
    Ship.create(purchase_id: purchase.id,postal_cord: postal_cord,prefecture_id: prefecture_id,city: city,word: word,building: building,phone_number: phone_number)
  end
end