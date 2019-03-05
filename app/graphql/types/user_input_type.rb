module Types
  class UserInputType < Types::BaseInputObject
    argument :name, String, required: false
    argument :email, String, required: false
    argument :password, String, required: false
  end
end
