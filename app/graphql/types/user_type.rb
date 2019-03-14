module Types
  class UserType < Types::BaseObject
    extend GraphqlRelationHelper
    has_many :products

    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :order_groups, [OrderGroupType], null: false
  end
end
