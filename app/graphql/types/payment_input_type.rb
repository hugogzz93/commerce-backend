module Types
  class PaymentInputType < Types::BaseInputObject
    argument :order_group_id, String, required: true
    # argument :first_name, String, required: true
    # argument :last_name, String, required: true
    # argument :number, String, required: true
    # argument :month, String, required: true
    # argument :year, String, required: true
    # argument :verification_value, String, required: true
    # argument :order_id, ID, required: true
    # argument :description, String, required: true
    # argument :billing_address_id, ID, required: true
    # argument :shipping_address_id, ID, required: true
  end
end
