defmodule Who.ProPublicaAPI.Member do
  @moduledoc """
    This module defines methods for querying the ProPublica API
    for individual member (i.e. Representative or Sentaor) information

    Search options include:
    1. Get Member by bio ID
    2. Get member by state/chamber/district
  """
  import Who.ProPublicaAPI.Base

  @doc """
    Query for Member by member_id as assigned by the Biographical Directory of the United States Congress.

    http://bioguide.congress.gov/biosearch/biosearch.asp

    EX:
      get_member_by_id("K000388")
    """
  @spec get_member_by_id(String.t) :: map()
  def get_member_by_id(member_id) do
    [member] =
      get_api_endpoint() <> "members/#{member_id}.json"
      |> make_request(get_api_header())
  end

  @doc """
    Query for Members from a specific state by chamber and/or district.

    EX:
      get_member_by_state("senate", "NJ")
      get_member_by_state("house", "NJ")
      get_member_by_state("house", "NJ", 12)
  """
  @spec get_member_by_state(String.t(), String.t()) :: map()
  @spec get_member_by_state(String.t(), String.t(), non_neg_integer()) :: map()
  @spec get_member_by_state(String.t(), any(), any()) :: map()
  def get_member_by_state(chamber, state) do
    [member] =
      get_api_endpoint() <> "members/#{chamber}/#{state}/current.json"
      |> make_request(get_api_header())
  end

  def get_member_by_state("house", state, district) do
    member =
      get_api_endpoint() <> "members/house/#{state}/#{district}/current.json"
      |> make_request(get_api_header())
  end

  def get_member_by_state("senate", _, _) do
    IO.puts :stderr, ~s(Did you mean "house"? There are no districts in the senate...)
  end

  @doc """
    Query for a Member's voting positions by bio ID.

    EX:
      get_member_votes("K000388")
  """

  @spec get_member_votes(String.t()) :: map()
  def get_member_votes(member_id) do
    votes =
      get_api_endpoint() <> "members/#{member_id}/votes.json"
      |> make_request(get_api_header())
  end
end