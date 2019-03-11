module BaseQuery
  def add_model_query(model)
    name = model.name
    field name.downcase.pluralize, ["Types::#{name}Type".constantize], null: false do
      argument :query, "Types::#{name}QueryType".constantize, required: false
    end

    define_method name.to_s.pluralize.downcase do |query: nil|
      name.to_s.camelcase.singularize.capitalize.constantize.where(query.to_h)
    end
  end
end
