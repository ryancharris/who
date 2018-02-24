defmodule Who.Repo.Migrations.AddRecentBillsTable do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:bills) do
      add :bill_id, :string
      add :type, :string
      add :number, :string
      add :title, :string
      add :summary, :string
      add :json_uri, :string

      add :introduced, :date
      add :last_vote, :date
      add :last_action_date, :date
      add :last_action, :string

      add :sponsor_title, :string
      add :sponsor_name, :string
      add :sponsor_id, :string
      add :num_of_cosponsors, :integer
      add :num_of_dem_cosponsors, :integer
      add :num_of_rep_cosponsors, :integer

      add :active, :boolean
      add :passed_house, :boolean
      add :passed_senate, :boolean

      timestamps()
    end
  end
end
