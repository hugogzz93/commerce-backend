module Types
  class OrderGroupType < Types::BaseObject
    field :orders, [OrderType], null: true
    field :id, String, null: true
    field :created_at, String, null: true
    field :total, Float, null: true
    field :status, String, null: true
  end
end
