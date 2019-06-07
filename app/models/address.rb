class Address < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :nullify

  validates :user, presence: true
  before_save :validate_only_one_default_address

  def validate_only_one_default_address
    return unless is_default_delivery_address?
    user.addresses.where.not(id: self.id).update_all(is_default_delivery_address: false)
  end
end
