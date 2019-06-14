module Mutations
  class CategoryOps < GraphQL::Schema::Object
    include GraphqlMutation
    is_mutation_of Category
  end
end
