module GraphqlRelationHelper
  def has_many(relation)
    model = relation.to_s.camelcase.singularize
    field relation, ["Types::#{model}Type".constantize], null: false do
      argument :query, "Types::#{model}QueryType".constantize, required: false
    end

    define_method relation do |query: nil|
      if(object)
        object.send(relation).where(query.to_h)
      else
        model.constantize.where(query.to_h)
      end
    end
  end

  def belongs_to(name)
    field name, "Types::#{name.to_s.capitalize}Type".constantize, null: false

    define_method name do |query: nil|
      object.send(name)
    end
  end
end
