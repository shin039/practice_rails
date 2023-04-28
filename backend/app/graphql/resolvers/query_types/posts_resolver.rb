module Resolvers::QueryTypes
  class PostsResolver < GraphQL::Schema::Resolver
    type [Types::PostType], null: false
    def resolve
      Post.all
    end
  end
end
