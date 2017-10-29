defmodule Graphql.Accounts.UserResolver do
  alias Graphql.{Accounts.User, Repo}

  def all(_args, _info) do
    {:ok, Repo.all(User)}
  end
end
