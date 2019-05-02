class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order
  has_one :client, through: :order
  has_one :vendor, through: :order
  before_validation :set_same_price_as_product

  validates :price, presence: true,
                    numericality: { greater_than: 0 }

  validates :amount, presence: true,
                     numericality: { greater_than: 0,
                                     only_integer: true,
                                     less_than_or_equal_to: ->(item) { item.product.stock } }

  after_create :reduce_inventory_by_amount!

  delegate :name, to: :product

  def set_same_price_as_product
    self.price = product.price
  end

  def reduce_inventory_by_amount!
    product.update!(stock: product.stock - amount)
  end

  def total
    price * amount
  end
end
