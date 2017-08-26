defmodule Who.ProPublicaAPI.Bill do
  @moduledoc """
    This module defines methods for querying the ProPublica API
    for information on specific bills
  """

  import Who.ProPublicaAPI.Base

  @doc """
   Returns a JSON blob representing the last 20 votes in a given
   chamber of Congress by type.

   EX:
    Who.ProPublicaAPI.Bill.get_recent_bills("both", "enacted")
    Who.ProPublicaAPI.Bill.get_recent_bills("senate", "introduced")
    Who.ProPublicaAPI.Bill.get_recent_bills("house", "passed")
  """
  @spec get_recent_bills(String.t, String.t) :: list
  def get_recent_bills(chamber, type) do
    get_api_endpoint() <> "115/#{chamber}/bills/#{type}.json"
    |> make_request(get_api_header())
  end

  @doc """
  Returns a JSON blob representing a specific bill's (selected by
  bill_id or "slug") content, history, status, etc.

  EX:
    Who.ProPublicaAPI.Bill.get_bill_by_id("hr21")
  """
  @spec get_bill_by_id(String.t) :: list
  def get_bill_by_id(id) do
    get_api_endpoint() <> "115/bills/#{id}.json"
    |> make_request(get_api_header())
  end

  @doc """
  Selected by bill_id, this function returns JSON information
  about a given Bill's cosponsors.

  EX:
    Who.ProPublicaAPI.Bill.get_bill_cosponsors_by_id("hr2430")
  """
  @spec get_bill_cosponsors_by_id(String.t) :: list
  def get_bill_cosponsors_by_id(bill_id) do
    get_api_endpoint() <> "115/bills/#{bill_id}/cosponsors.json"
    |> make_request(get_api_header)
  end
end