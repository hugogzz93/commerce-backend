class Order < ApplicationRecord
  enum status: { in_progress: 0, in_transit: 1, delivered: 2, canceled: 3 }
  validates :client, presence: true
  validates :vendor, presence: true
  validates :status, presence: true
  belongs_to :client, class_name: :User, inverse_of: :orders_as_client
  belongs_to :vendor, class_name: :User, inverse_of: :orders_as_vendor
end