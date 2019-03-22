class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :category
  has_many :order_items, dependent: :restrict_with_error

  validates :user, presence: true

  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 0 }

  validates :stock, presence: true,
                    numericality: { greater_than_or_equal_to: 0,
                                    only_integer: true }
  validates :category, presence: true

  validates :name, presence: true,
                   uniqueness: { scope: :user_id,
                                 case_sensitive: false }
end
