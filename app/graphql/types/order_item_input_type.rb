module Types
  class OrderItemInputType < Types::BaseInputObject
    argument :product_id, ID, required: false
    argument :amount, Integer, required: false
  end
end
