class Transaction < ApplicationRecord
  belongs_to :order
  validates :order, presence: true
  enum status: { pending: 0, failed: 1, success: 2 }
end
