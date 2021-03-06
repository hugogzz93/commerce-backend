class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :addresses, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :orders_as_vendor, dependent: :destroy,
                              class_name: :Order, inverse_of: :vendor,
                              foreign_key: :vendor_id
  has_many :orders_as_client, dependent: :destroy,
                              class_name: :Order, inverse_of: :client,
                              foreign_key: :client_id
  has_many :order_items_as_vendor,
           dependent: :destroy,
           class_name: :OrderItem,
           through: :orders_as_vendor,
           source: :order_items

  has_many :order_items_as_client,
           dependent: :destroy,
           class_name: :OrderItem,
           through: :orders_as_client,
           source: :order_items

  before_save :ensure_authentication_token

  def order_groups
    orders_as_client.pluck(:group_id).uniq.map { |gid| OrderGroup.new gid }
  end

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.find_by(authentication_token: token)
    end
  end
end
