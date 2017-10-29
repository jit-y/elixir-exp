defmodule Graphql.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:accounts_users) do
      add :name, :string
      add :email, :string

      timestamps()
    end

  end
end
