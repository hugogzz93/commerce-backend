class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :user, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0}
  validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true}
  validates :category, presence: true
  validates :name, presence: true, uniqueness: { scope: :user_id, case_sensitive: false }
end
