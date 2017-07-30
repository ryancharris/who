defmodule Who.Member do
  use Ecto.Schema
  import Ecto.Changeset
  alias Who.Member

  @required_fields ~w(
      chamber
      current_party
      date_of_birth
      district
      end_date
      first_name
      last_name
      member_id
      start_date
      state
      title
    )a

  @optional_fields ~w(
      at_large
      bills_cosponsored
      bills_sponsored
      contact_form
      facebook_account
      fax
      middle_name
      missed_votes_pct
      most_recent_vote
      office
      phone
      twitter_account
      url
      votes_with_party_pct
      youtube_account
    )a


  schema "members" do
    field :at_large, :string
    field :bills_cosponsored, :integer
    field :bills_sponsored, :integer
    field :chamber, :string
    field :contact_form, :string
    field :current_party, :string
    field :date_of_birth, :date
    field :district, :integer
    field :end_date, :date
    field :facebook_account, :string
    field :fax, :string
    field :first_name, :string
    field :last_name, :string
    field :member_id, :string
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
  def changeset(%Member{} = member, attrs \\ %{}) do
    member
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required([@required_fields])
  end
end
