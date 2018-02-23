defmodule Who.Member do
  use Ecto.Schema

  schema "member" do
    field :member_id, :string

    field :short_title, :string
    field :first_name, :string
    field :middle_name, :string
    field :last_name, :string

    field :state, :string
    field :party, :string
    field :votes_with_party, :float
    field :chamber, :string
    field :district, :string
    field :office, :string

    field :url, :string
    field :twitter_account, :string
    field :facebook_account, :string
    field :youtube_account, :string

    timestamps()
  end
end
