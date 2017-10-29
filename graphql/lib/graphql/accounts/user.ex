defmodule Graphql.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Graphql.Accounts.User

  schema "accounts_users" do
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
  end
end
