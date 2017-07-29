defmodule Who.Member do
  use Ecto.Schema
  import Ecto.Changeset
  alias Who.Member


  schema "members" do
    field :at_large, :string
    field :bills_cosponsored, :integer
    field :bills_sponsored, :integer
    field :chamber, :string
    field :committees, {:map, :string}
    field :contact_form, :string
    field :current_party, :string
    field :date_of_birth, :date
    field :disctict, :integer
    field :end_date, :date
    field :facebook_account, :string
    field :fax, :string
    field :first_name, :string
    field :last_name, :string
    field :middle_name, :string
    field :missed_votes_pct, :float
    field :most_recent_vote, :date
    field :office, :string
    field :phone, :string
    field :start_date, :date
    field :state, :string
    field :title, :string
    field :twitter_account, :string
    field :url, :string
    field :votes_with_party_pct, :float
    field :youtube_account, :string

    timestamps()
  end

  @doc false
  def changeset(%Member{} = member, attrs) do
    member
    |> cast(attrs, [:first_name, :middle_name, :last_name, :date_of_birth, :url, :twitter_account, :facebook_account, :youtube_account, :current_party, :most_recent_vote, :chamber, :title, :state, :disctict, :at_large, :start_date, :end_date, :office, :phone, :fax, :contact_form, :bills_sponsored, :bills_cosponsored, :missed_votes_pct, :votes_with_party_pct, :committees])
    |> validate_required([:first_name, :middle_name, :last_name, :date_of_birth, :url, :twitter_account, :facebook_account, :youtube_account, :current_party, :most_recent_vote, :chamber, :title, :state, :disctict, :at_large, :start_date, :end_date, :office, :phone, :fax, :contact_form, :bills_sponsored, :bills_cosponsored, :missed_votes_pct, :votes_with_party_pct, :committees])
  end
end
