module Types
  class CategoryType < Types::BaseObject
    extend GraphqlRelationHelper
    has_many :products

    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: true
    field :vendors, [UserType], null: false
  end
end
