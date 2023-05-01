defmodule Catalog.Repo.Migrations.AddStoreProductAssociation do
  use Ecto.Migration

  def change do
    alter table("products") do
      add :store_id, references(:stores)

    end
  end
end
