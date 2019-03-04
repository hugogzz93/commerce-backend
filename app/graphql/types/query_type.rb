module Types
  class QueryType < Types::BaseObject

    def self.add_model_query(name, type)
      field name, type, null: false do
        argument :id, ID, required: false
      end

      define_method name.to_s do |query = nil|
        name.to_s.camelcase.singularize.capitalize.constantize.where(query)
      end
    end

    add_model_query :users, [UserType]
    add_model_query :categories, [CategoryType]
    add_model_query :products, [ProductType]
    add_model_query :orders, [OrderType]
    add_model_query :order_items, [OrderItemType]
  end
end
