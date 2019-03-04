class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :vendors, through: :products, source: :user
  validates :name, presence: true, uniqueness: true
end
