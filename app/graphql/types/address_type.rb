module Types
  class AddressType < Types::BaseObject
    extend GraphqlRelationHelper
    belongs_to :user
    has_many :orders

    field :country, String, null: false
    field :full_name, String, null: false
    field :street1,String, null: false
    field :street2, String, null: true
    field :city, String, null: false
    field :zip, String, null: false
    field :phone, String, null: false
    field :security_code, String, null: true
    field :instructions, String, null: true
  end
end
