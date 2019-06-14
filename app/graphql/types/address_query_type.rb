module Types
  class AddressQueryType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :user_id, ID, required: false
    argument :city, String, required: false
  end
end
