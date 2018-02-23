defmodule Who.Repo.Migrations.UpdateMemberTable do
  use Ecto.Migration

  def change do
    alter table(:member) do
      modify :member_id, :string
      remove :start_date
      remove :end_date
    end
  end
end
