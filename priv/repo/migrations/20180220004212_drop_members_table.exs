defmodule Who.Repo.Migrations.DropMembersTable do
  use Ecto.Migration

  def change do
    drop_if_exists table(:members)
  end
end
