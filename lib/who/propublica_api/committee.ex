defmodule Who.ProPublicaAPI.Committee do
  @moduledoc """
  This module defines methods for querying the ProPublica API for information
  about specific Congressional committees and/or subcommittees
  """
  import Who.ProPublicaAPI.Base


  #
  # TODO: Move this to Who.ProPublicaAPI.Chamber
  #

  @doc """
  Get a list of committees and subcommitees by Chamber.

  EX:
    Who.ProPublicaAPI.Committee.get_commitee_info("house")
  """
  @spec get_commitee_info(String.t) :: list
  def get_commitee_info(chamber) do
    get_api_endpoint() <> "115/#{chamber}/committees.json"
    |> make_request(get_api_header())
  end

  @doc """
  Query the API for information about a specific Committee
  in a given Chamber of Congress.

  EX:
    Who.ProPublicaAPI.Committee.get_commitee_info("house", "hspw")
  """
  @spec get_commitee_info(String.t, String.t) :: list
  def get_commitee_info(chamber, committee_id) do
    get_api_endpoint() <> "115/#{chamber}/committees/#{committee_id}.json"
    |> make_request(get_api_header())
  end

  @doc """
  Get information about recent hearings held by a given Committee.

  EX:
    Who.ProPublicaAPI.Committee.get_committee_hearings("house", "hspw")
  """
  def get_committee_hearings(chamber, committee_id) do
    get_api_endpoint() <> "115/#{chamber}/committees/#{committee_id}/hearings.json"
    |> make_request(get_api_header())
  end

end