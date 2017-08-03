defmodule Who.ProPublicaAPI.Member do
  @moduledoc """
    This module defines methods for querying the ProPublica API
    for individual member (i.e. Representative or Sentaor) information
  """
  import Who.ProPublicaAPI.Base

  @doc """
      Query the API based on member_id assigned by the Biographical Directory of the United States Congress

      http://bioguide.congress.gov/biosearch/biosearch.asp
    """
  @spec get_member_by_id(String.t) :: map()
  def get_member_by_id(member_id) do
    get_api_endpoint() <> "members/#{member_id}.json"
      |> make_request(get_api_header())
  end

  @doc """
    Query the API for members from a specific chamber by state and/or

    EX:
      get_member_by_state("senate", "NJ")
      get_member_by_state("house", "NJ")
      get_member_by_state("house", "NJ", 12)
  """
  @spec get_member_by_state(String.t(), String.t()) :: map()
  @spec get_member_by_state(String.t(), String.t(), non_neg_integer()) :: map()
  @spec get_member_by_state(String.t(), any(), any()) :: map()
  def get_member_by_state(chamber, state) do
    get_api_endpoint() <> "members/#{chamber}/#{state}/current.json"
      |> make_request(get_api_header())
  end
  def get_member_by_state("house", state, district) do
    get_api_endpoint() <> "members/house/#{state}/#{district}/current.json"
      |> make_request(get_api_header())
  end
  def get_member_by_state("senate", _, _) do
    IO.puts :stderr, ~s(Did you mean "house"? There are no districts in the senate...)
  end
end