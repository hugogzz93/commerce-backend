module Mutations
  class SignOut < GraphQL::Schema::Mutation
    field :error, Boolean, null: false
    def resolve
      current_user.update!(authentication_token: nil)
      false
    rescue StandardError
      true
    end
  end
end
