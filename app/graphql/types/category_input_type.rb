module Types
  class CategoryInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :name, String, required: false
    argument :description, String, required: false
  end
end
