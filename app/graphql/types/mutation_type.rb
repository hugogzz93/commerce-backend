module Types
  class MutationType < Types::BaseObject
    UserOps = BaseOps.create_default_mutation(User)
    ProductOps = BaseOps.create_default_mutation(Product)

    field :product, ProductOps, null: false do
      argument :id, ID, required: false
    end

    field :user, UserOps, null: false do
      argument :id, ID, required: false
    end

    def user(id: nil)
      id ? User.find(id) : UserOps
    end

    def product(id: nil)
      id ? Product.find(id) : ProductOps
    end
  end
end
