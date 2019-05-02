module Types
  class MutationType < Types::BaseObject
    UserOps = GraphqlMutation.create_ops_for User
    ProductOps = GraphqlMutation.create_ops_for Product

    field :product, ProductOps, null: false do
      argument :id, ID, required: false
    end

    field :user, UserOps, null: false do
      argument :id, ID, required: false
    end

    field :order, Mutations::OrderOps, null: false do
      argument :id, ID, required: false
    end

    field :payment, Mutations::PaymentOps, null: false

    field :sign_in, mutation: Mutations::SignIn
    field :sign_out, mutation: Mutations::SignOut

    def user(id: nil)
      id ? User.find(id) : UserOps
    end

    def product(id: nil)
      id ? Product.find(id) : ProductOps
    end

    def order(id: nil)
      id ? Order.find(id) : Mutations::OrderOps
    end

    def payment
      Mutations::PaymentOps
    end
  end
end
