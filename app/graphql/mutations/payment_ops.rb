require 'active_merchant'

module Mutations
  class PaymentOps < GraphQL::Schema::Object
    # include GraphqlMutation

    field :setup, String, null: false do
      argument :input, Types::PaymentInputType, required: true
    end


    def setup(req)
      input = req[:input].to_h
      
      order_group = OrderGroup.new input[:order_id]

      paypal_options = {
        login: 'pinelo93-facilitator_api1.gmail.com',
        password: 'YKCNSM2Y7AE5MENZ',
        signature: 'AbQ-zlF-r4myrkLI0FscnoW5AQiSAXxOXmQ4ZjoFf6AaPkoCuwj.e2Gf'
      }

      gateway = ActiveMerchant::Billing::PaypalExpressGateway.new(paypal_options)
      payment_options = {
        return_url: 'http://localhost:3000/checkout/success',
        cancel_return_url: 'http://localhost:3000/checkout/cancel',
        ip: context[:request_ip],
        currency: 'MXN',
        allow_guest_checkout: true,
        items: order_group.order_items.map {|x| {
          name: x.name,
          description: x.name,
          quentity: x.amount,
          amount: x.total * 100
        }}
      }
      response = gateway.setup_purchase(order_group.total * 100, payment_options)

      if response.success?
        return gateway.redirect_url_for(response.token)
      else
         return GraphQL::ExecutionError.new('PaymentInvalid')
      end
    end
  end
end
