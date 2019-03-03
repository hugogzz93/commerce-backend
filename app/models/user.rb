class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true

  has_many :products, dependent: :destroy
  has_many :orders_as_vendor, dependent: :destroy,
                              class_name: :Order, inverse_of: :vendor,
                              foreign_key: :vendor_id
  has_many :orders_as_client, dependent: :destroy,
                              class_name: :Order, inverse_of: :client,
                              foreign_key: :client_id
end
