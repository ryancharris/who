defmodule Who.Repo.Migrations.AddMemberIdFieldToMembers do
  use Ecto.Migration

  def change do
    alter table(:members) do
      add :member_id, :string
    end
  end
end
