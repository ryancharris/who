defmodule Who.Bill do
  use Ecto.Schema

  schema "bill" do
    field :bill_id, :string
    field :type, :string
    field :number, :string
    field :title, :string
    field :summary, :string
    field :json_uri, :string

    field :introduced, :string
    field :last_vote, :string
    field :last_action_date, :string
    field :last_action, :string

    field :sponsor_title, :string
    field :sponsor_name, :string
    field :sponsor_id, :string
    field :num_of_cosponsors, :integer
    field :num_of_dem_cosponsors, :integer
    field :num_of_rep_cosponsors, :integer

    field :active, :boolean
    field :passed_house, :string
    field :passed_senate, :string

    timestamps()
  end
end
