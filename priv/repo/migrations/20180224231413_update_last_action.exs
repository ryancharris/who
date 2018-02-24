defmodule Who.Repo.Migrations.UpdateLastAction do
  use Ecto.Migration

  def change do
    alter table(:bill) do
      modify :last_action, :text
    end
  end
end
