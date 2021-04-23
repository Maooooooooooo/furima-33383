class PurchaseForm
  include ActiveModel::Model

  attr_accessor :purchase, :ship
  validates :purchase, presence: true
  validates :ship, presence: true

  def save
    Purchase.create(purchase: purchase)
    Ship.create(ship: ship)
  end
end