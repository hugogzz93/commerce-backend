class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order
  has_one :client, through: :order
  has_one :vendor, through: :order
  before_validation :set_same_price_as_product

  validates :price, presence: true,
                    numericality: { greater_than: 0}

  validates :amount, presence: true,
    numericality: { greater_than: 0,
                    only_integer: true,
                    less_than_or_equal_to: -> (item) {item.product.stock} }


  def set_same_price_as_product
    self.price = product.price
  end
end
