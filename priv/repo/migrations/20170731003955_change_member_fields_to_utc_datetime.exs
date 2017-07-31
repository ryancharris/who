defmodule Who.Repo.Migrations.ChangeMemberFieldsToUtcDatetime do
  use Ecto.Migration

  def change do
    alter table(:members) do
      modify :date_of_birth, :utc_datetime
      modify :end_date, :utc_datetime
      modify :most_recent_vote, :utc_datetime
      modify :start_date, :utc_datetime
    end
  end
end
