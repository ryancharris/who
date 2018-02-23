defmodule Who.Member do
  use Ecto.Schema

  schema "member" do
    field :member_id, :integer

    field :short_title, :string
    field :first_name, :string
    field :middle_name, :string
    field :last_name, :string

    field :state, :string
    field :party, :string
    field :votes_with_party, :float
    field :chamber, :string
    field :district, :integer
    field :office, :string

    field :url, :string
    field :twitter_url, :string
    field :facebook_url, :string
    field :youtube_url, :string

    field :start_date, :date
    field :end_date, :date

    timestamps()
  end
end
