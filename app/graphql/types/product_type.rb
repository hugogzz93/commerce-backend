module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :user, UserType, null: false
    field :stock, Int, null: false
    field :price, Float, null: false
  end
end
