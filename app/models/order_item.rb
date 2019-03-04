class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order
  has_one :client, through: :order
  has_one :vendor, through: :order
  before_create :set_same_price_as_product

  def set_same_price_as_product
    self.price = product.price
  end
end
