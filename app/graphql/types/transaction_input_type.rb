module Types
  class TransactionInputType < Types::BaseInputObject
    field :status, String, null: false
    field :value, Float, null: false
  end
end
