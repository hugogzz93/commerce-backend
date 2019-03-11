module Types
  class UserQueryType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :name, String, required: false
    argument :email, String, required: false
  end
end
