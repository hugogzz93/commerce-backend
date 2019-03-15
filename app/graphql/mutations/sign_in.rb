module Mutations
  class SignIn < GraphQL::Schema::Mutation
    field :auth_token, String, null: true

    argument :email, String, required: true
    argument :password, String, required: true

    def resolve(email:, password:)
      user = User.find_for_authentication(email: email)
      return nil unless user
      return nil unless user.valid_password? password
      auth_token = Devise.friendly_token
      user.update! authentication_token: auth_token
      { auth_token: auth_token }
    end
  end
end
