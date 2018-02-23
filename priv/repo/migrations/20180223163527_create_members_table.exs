defmodule Who.Repo.Migrations.CreateMembersTable do
  use Ecto.Migration

  def up do
    create table(:member) do
      add :member_id, :integer

      add :short_title, :string
      add :first_name, :string
      add :middle_name, :string
      add :last_name, :string

      add :state, :string
      add :party, :string
      add :votes_with_party, :float
      add :chamber, :string
      add :district, :integer
      add :office, :string

      add :url, :string
      add :twitter_url, :string
      add :facebook_url, :string
      add :youtube_url, :string

      add :start_date, :date
      add :end_date, :date

      timestamps()
    end
  end

  def down do
    drop_if_exists table("member")
  end
end
