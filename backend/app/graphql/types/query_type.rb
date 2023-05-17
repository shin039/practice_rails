module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # --------------------------------------------------------------------------
    # Debug
    # --------------------------------------------------------------------------
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      str_hello = "Hello World by Query."
      # str_hello unless true # unless -> falseの時に実行する
      method_test(str_hello) if true
    end

    # private method
    def method_test (msg) "It's Method Test =>  #{msg}" end

    field :name, String, null: false, description: "This is Test"
    def name() "This is Test." end

    # --------------------------------------------------------------------------
    # Users
    # --------------------------------------------------------------------------
    field :user, Types::UserType, null: true do argument :id, ID, required: true end
    def user(id:) User.find(id) end

    field :users, [Types::UserType], null: false
    def users
      User.all
    end

    # --------------------------------------------------------------------------
    # Posts
    # --------------------------------------------------------------------------
    field :posts, resolver: Resolvers::QueryTypes::PostsResolver

  end
end
