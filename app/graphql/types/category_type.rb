module Types
  class CategoryType < Types::BaseObject
    extend GraphqlRelationHelper
    has_many :products

    field :id, ID, null: false
    field :name, String, null: false
    field :products, [ProductType], null: false
    field :vendors, [UserType], null: false

  end
end
