defmodule GraphqlWeb.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Graphql.Repo

  object :accounts_user do
    field :id, :id
    field :name, :string
    field :email, :string
  end

  object :blog_post do
    field :id, :id
    field :title, :string
    field :body, :string
  end
end
