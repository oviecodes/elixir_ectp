defmodule Catalog.Repo.Migrations.AddUserStoreAssociation do
  use Ecto.Migration

  def change do
    alter table("stores") do
      add :user_id, references(:users)

    end
  end
end
