module Types
  class AddressType < Types::BaseObject
    extend GraphqlRelationHelper
    belongs_to :user
    has_many :orders

    field :id, ID, null: false
    field :country, String, null: true
    field :full_name, String, null: true
    field :street1, String, null: true
    field :street2, String, null: true
    field :city, String, null: true
    field :zip, String, null: true
    field :phone, String, null: true
    field :security_code, String, null: true
    field :instructions, String, null: true
  end
end
