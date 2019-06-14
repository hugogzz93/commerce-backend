module Types
  class OrderInputType < Types::BaseInputObject
    argument :vendor_id, ID, required: false
    argument :client_id, ID, required: false
    argument :address_id, ID, required: false
    argument :order_items_attributes, [OrderItemInputType], required: false
    argument :status, OrderStatus, required: false
  end
end
