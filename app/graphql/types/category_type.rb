module Types
  class CategoryType < Types::BaseObject
    extend BaseQuery
    field :id, ID, null: false
    field :name, String, null: false
    field :products, [ProductType], null: false
    field :vendors, [UserType], null: false

    add_model_query Category
  end
end
