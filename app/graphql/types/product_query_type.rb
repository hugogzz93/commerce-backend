module Types
  class ProductQueryType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :ids, [ID], required: false
    argument :category_id, ID, required: false
    argument :name, String, required: false
    argument :user_id, ID, required: false
  end
end
