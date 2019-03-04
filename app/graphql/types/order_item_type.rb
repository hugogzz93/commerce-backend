module Types
  class OrderItemType < Types::BaseObject
    field :id, ID, null: false
    field :price, Integer, null: false
    field :product, ProductType, null: false
    field :vendor, UserType, null: false
    field :client, UserType, null: false
    field :Order, OrderType, null: false
  end
end
