module Mutations
  class OrderOps < Types::BaseObject
    field :create_group, Types::OrderGroupType, null: false do
      argument :input, Types::OrderGroupInputType, required: false
    end

    field :update, Types::OrderType, null: false do
      argument :input, Types::OrderInputType, required: false
    end

    def create_group(req=nil)
      orders = req[:input][:orders].map do |raw_input|
        Order.new raw_input.to_h
      end
      begin
        OrderGrouper.create_group!(orders)
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("RecordInvalid")
      end
    end

    def update(input:)
      object.update(input.to_h)
      object.reload
    end
  end
end
