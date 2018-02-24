defmodule Who.Repo.Migrations.UpdateBillDates do
  use Ecto.Migration

  def change do
    alter table(:bill) do
      modify :passed_house, :string
      modify :passed_senate, :string
    end
  end
end
