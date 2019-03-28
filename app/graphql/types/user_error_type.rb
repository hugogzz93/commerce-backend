module Types
  class UserError < Types::BaseObject
    description "A user-readeable error"
    field :message, String, null: false,
                            description: "Descrption of the error"
    field :path, [String], null: false,
                           descrption: "Which input value this error comes from"
  end
end
