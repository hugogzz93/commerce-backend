module Types
  class OrderGroupType < Types::BaseObject
    field :orders, [OrderType], null: true
    field :group_id, String, null: true

    def group_id
      object ? object[0].group_id : nil
    end

    def orders
      object ? object : nil
    end
  end
end
