module Types
  class OrderType < Types::BaseObject
    field :id, ID, null: false
    field :client_id, ID, null: false
    field :vendor_id, ID, null: false
    field :status, String, null: false
    field :group_id, String, null: true
    field :client, UserType, null: false
    field :vendor, UserType, null: false
    # field :products, [ProductType], null: false
    field :created_at, String, null: false
  end
end
