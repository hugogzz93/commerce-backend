module Mutations
  class SignOut < GraphQL::Schema::Mutation
    field :error, Boolean, null: false
    def resolve
      begin
        current_user.update!(authentication_token: nil)
        return false
      rescue
        return true
      end
    end

  end
end
