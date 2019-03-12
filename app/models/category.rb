class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :vendors, -> { distinct }, through: :products, source: :user
  validates :name, presence: true, uniqueness: true
end
