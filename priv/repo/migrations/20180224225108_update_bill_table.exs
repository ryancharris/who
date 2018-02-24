defmodule Who.Repo.Migrations.UpdateBillTable do
  use Ecto.Migration

  def change do
    alter table(:bills) do
      modify :introduced, :string
      modify :last_vote, :string
      modify :last_action_date, :string
    end
  end
end
