module Types
  class OrderGroupInputType < Types::BaseInputObject
    argument :orders, [Types::OrderInputType], required: true
  end
end
