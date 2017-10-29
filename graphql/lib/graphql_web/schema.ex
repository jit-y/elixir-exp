defmodule GraphqlWeb.Schema do
  use Absinthe.Schema
  import_types GraphqlWeb.Schema.Types

  query do
    field :blog_posts, list_of(:blog_post) do
      resolve &Graphql.Blog.PostResolver.all/2
    end

    field :accounts_users, list_of(:accounts_user) do
      resolve &Graphql.Accounts.UserResolver.all/2
    end
  end
end
