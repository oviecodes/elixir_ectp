defmodule Catalog.Repo.Migrations.Product do
  use Ecto.Migration

  def change do
    create table("products") do
      add :name, :string
      add :price, :float
      add :description, :string

      timestamps()
    end
  end
end
