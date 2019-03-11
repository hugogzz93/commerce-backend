module Types
  class ProductType < Types::BaseObject
    extend GraphqlRelationHelper
    belongs_to :user
    belongs_to :category

    field :id, ID, null: false
    field :user_id, ID, null: false
    field :category_id, ID, null: false
    field :name, String, null: false
    field :user, UserType, null: false
    field :stock, Int, null: false
    field :price, Float, null: false
  end
end
