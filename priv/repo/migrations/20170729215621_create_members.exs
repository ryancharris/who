defmodule Who.Repo.Migrations.CreateMembers do
  use Ecto.Migration

  def change do
    create table(:members) do
      add :first_name, :string
      add :middle_name, :string
      add :last_name, :string
      add :date_of_birth, :date
      add :url, :string
      add :twitter_account, :string
      add :facebook_account, :string
      add :youtube_account, :string
      add :current_party, :string
      add :most_recent_vote, :date
      add :chamber, :string
      add :title, :string
      add :state, :string
      add :disctict, :integer
      add :at_large, :string
      add :start_date, :date
      add :end_date, :date
      add :office, :string
      add :phone, :string
      add :fax, :string
      add :contact_form, :string
      add :bills_sponsored, :integer
      add :bills_cosponsored, :integer
      add :missed_votes_pct, :float
      add :votes_with_party_pct, :float
      add :committees, {:map, :string}

      timestamps()
    end

  end
end
