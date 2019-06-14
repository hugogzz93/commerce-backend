module Types
  class TransactionType < Types::BaseObject
    extend GraphqlRelationHelper
    belongs_to :order

    field :id, ID, null: false
    field :status, String, null: false
    field :value, Float, null: false

  end
end
