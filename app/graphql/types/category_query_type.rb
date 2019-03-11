module Types
  class CategoryQueryType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :name, String, required: false
  end
end
