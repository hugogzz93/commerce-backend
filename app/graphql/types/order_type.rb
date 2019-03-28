module Types
  class OrderStatus < Types::BaseEnum
    value "in_progress"
    value "in_transit"
    value "delivered"
    value "canceled"
  end

  class OrderType < Types::BaseObject
    extend GraphqlRelationHelper
    # TODO: add classNames to relation helper
    # belongs_to :vendor, class_name: :user
    belongs_to :address

    field :id, ID, null: false
    field :client_id, ID, null: false
    field :vendor_id, ID, null: false
    field :status, OrderStatus, null: false
    field :total, Float, null: false
    field :group_id, String, null: true
    field :client, UserType, null: false
    field :vendor, UserType, null: false
    field :order_items, [OrderItemType], null: false
    field :created_at, String, null: false
  end
end
