defmodule WhoWeb.BillPresenter do
  @moduledoc """
    Takes in and processes data having to do with a given
    Bill and returns an object containing the aforementioned info.

    WhoWeb.BillPresenter.new()
  """

  @type t :: %__MODULE__{
    bill_id: String.t(),
    number: String.t(),
    title: String.t(),
    summary: String.t(),
    committees: list(String.t()),
    url: String.t(),
    date_introduced: String.t(),
    history: list(map()),

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
    bill_id: nil,
    number: nil,
    title: nil,
    summary: nil,
    committees: [],
    url: nil,
    date_introduced: nil,
    history: [],

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
      bill_id: Map.get(bill, "bill") |> format_bill_id,
      number: Map.get(bill, "bill"),
      title: Map.get(bill, "title"),
      summary: Map.get(bill, "summary"),
      committees: Map.get(bill, "committees"),
      url: Map.get(bill, "congressdotgov_url"),
      date_introduced: Map.get(bill, "introduced_date"),
      history: Map.get(bill, "actions") |> Enum.slice(1..5),

      sponsor_name: Map.get(bill, "sponsor"),
      sponsor_title: Map.get(bill, "sponsor_title"),
      sponsor_id: Map.get(bill, "sponsor_id"),
      sponsor_party: Map.get(bill, "sponsor_party"),

      has_cosponsors: Map.get(bill, "cosponsors") > 0,
      num_of_cosponsors: Map.get(bill, "cosponsors"),

      latest_action: Map.get(bill, "latest_major_action"),
      latest_action_date: Map.get(bill, "latest_major_action_date")
    }
  end

  @doc """
    Takes in a Bill number and returns a reformatted copy
    to use with ProPubica API requests.

    EX:
      format_bill_id(("H.R.21")
      >>> "hr21"
  """
  def format_bill_id(bill_number) do
    String.replace(bill_number, ~r/\W/, "")
    |> String.downcase
  end
end