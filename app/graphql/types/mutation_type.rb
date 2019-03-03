module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false,
                               description: "An example "
    def test_field
      "Hello World"
    end
  end
end
