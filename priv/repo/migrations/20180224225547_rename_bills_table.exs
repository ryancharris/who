defmodule Who.Repo.Migrations.RenameBillsTable do
  use Ecto.Migration

  def change do
    rename table(:bills), to: table(:bill)
  end
end
