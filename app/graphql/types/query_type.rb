module Types
  class QueryType < Types::BaseObject
    extend GraphqlRelationHelper

    has_many :users
    has_many :categories
    has_many :products
    has_many :orders
    has_many :order_items
    has_many :addresses

    field :current_user, Types::UserType, null: true

    def current_user
      context[:current_user]
    end
  end
end
