defmodule Who.Repo.Migrations.RenameMemberColumns do
  use Ecto.Migration

  def change do
    rename table(:member), :youtube_url, to: :youtube_account
    rename table(:member), :facebook_url, to: :facebook_account
    rename table(:member), :twitter_url, to: :twitter_account
  end
end
