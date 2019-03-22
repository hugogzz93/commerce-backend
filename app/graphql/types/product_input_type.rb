module Types
  class ProductInputType < Types::BaseInputObject
    argument :name, String, required: false
    argument :stock, Integer, required: false
    argument :price, Float, required: false
    argument :user_id, ID, required: false
    argument :category_id, ID, required: false
    argument :image, FileType, required: false
  end
end
