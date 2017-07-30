defmodule Who.Repo.Migrations.UpdateCommitteesColumnOnMembersTable do
  use Ecto.Migration

  def change do
    alter table(:members) do
      remove :committees
    end
  end
end
