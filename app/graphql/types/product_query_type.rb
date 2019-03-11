module Types
  class ProductQueryType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :name, String, required: false
  end
end
