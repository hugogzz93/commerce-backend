module Mutations
  class OrderOps < Types::BaseObject

    field :create_group, Types::OrderGroupType, null: false do
      argument :input, Types::OrderGroupInputType, required: false
    end

     def create_group(req = nil)
       orders = req[:input][:orders].map do |raw_input|
         Order.new raw_input.to_h
       end
      begin
        OrderGrouper.create_group! orders
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("RecordInvalid")
      end
    end
  end
end
