module Types
  class UserType < Types::BaseObject
    extend BaseQuery
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false

    add_model_query Product
  end
end
