module Types
  class QueryType < Types::BaseObject
    def self.add_model_query(model)
      name = model.name
      field name.downcase.pluralize, ["Types::#{name}Type".constantize], null: false do
        argument :query, "Types::#{name}InputType".constantize, required: false
      end

      define_method name.to_s.pluralize.downcase do |query: nil|
        name.to_s.camelcase.singularize.capitalize.constantize.where(query.to_h)
      end
    end

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
