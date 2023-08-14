module Types
  class MutationType < Types::BaseObject
    # --------------------------------------------------------------------------
    # Mutation Functions
    # --------------------------------------------------------------------------
    field :create_user, mutation: Mutations::CreateUser

    # --------------------------------------------------------------------------
    # Ruby Test 
    # --------------------------------------------------------------------------
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World by Mutation"
    end
  end
end
