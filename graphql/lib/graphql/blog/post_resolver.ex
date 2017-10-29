defmodule Graphql.Blog.PostResolver do
  alias Graphql.{Blog.Post, Repo}

  def all(_args, _info) do
    {:ok, Repo.all(Post)}
  end
end
