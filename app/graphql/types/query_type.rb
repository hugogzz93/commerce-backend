module Types
  class QueryType < Types::BaseObject
    extend BaseQuery

    add_model_query User
    add_model_query Category
    add_model_query Product
    add_model_query Order
    add_model_query OrderItem

    field :current_user, Types::UserType, null: true

    def current_user
      context[:current_user]
    end
  end
end
