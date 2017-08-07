defmodule WhoWeb.BillPresenter do
  @moduledoc """
  """

  @type t :: %__MODULE__{
    number: String.t(),
    title: String.t(),
    summary: String.t(),
    committees: list(String.t()),
    url: String.t(),
    date: String.t(),

    sponsor_name: String.t(),
    sponsor_title: String.t(),
    sponsor_id: String.t(),
    sponsor_party: String.t(),

    has_cosponsors: boolean(),
    num_of_cosponsors: integer(),

    latest_action: String.t(),
    latest_action_date: String.t()
  }

  defstruct [
    number: nil,
    title: nil,
    summary: nil,
    committees: nil,
    url: nil,
    date: nil,

    sponsor_name: nil,
    sponsor_title: nil,
    sponsor_id: nil,
    sponsor_party: nil,

    has_cosponsors: nil,
    num_of_cosponsors: nil,

    latest_action: nil,
    latest_action_date: nil
  ]

  @spec new(map()) :: nil | t()
  def new(nil), do: nil
  def new(bill) do
    %__MODULE__{
      number: Map.get(bill, "bill") |> format_bill_id,
      title: nil,
      summary: nil,
      committees: nil,
      url: nil,
      date: nil,

      sponsor_name: nil,
      sponsor_title: nil,
      sponsor_id: nil,
      sponsor_party: nil,

      has_cosponsors: nil,
      num_of_cosponsors: nil,

      latest_action: nil,
      latest_action_date: nil
    }
  end

  def format_bill_id(bill_number) do
    String.replace(bill_number, ~r/\W/, "")
    |> String.downcase
  end
end