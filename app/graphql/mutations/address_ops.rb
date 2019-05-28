module Mutations
  class AddressOps < Types::BaseObject
    include GraphqlMutation
    is_mutation_of Address
  end
end
