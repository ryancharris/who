defmodule Who.ProPublicaAPI.Chamber do
  @moduledoc """
    This module defines methods for querying the ProPublica API
    based on chamber of Congress (i.e. House or Senate)
  """

  import Who.ProPublicaAPI.Base

  @doc """
    Get a list of current members in either the House or Senate

    EX:
      get_members_by_chamber("house")
      get_members_by_chamber("senate")
  """
  @spec get_members_by_chamber(String.t) :: map()
  def get_members_by_chamber(chamber) do
    get_api_endpoint() <> "115/#{chamber}/members.json"
    |> make_request(get_api_header())
  end

  @doc """
    Get a list of recent floor actions by chamber

    EX:
      get_recent_chamber_actions("house")
      get_recent_chamber_actions("senate")
  """
  @spec get_recent_chamber_actions(String.t()) :: map()
  def get_recent_chamber_actions(chamber) do
    get_api_endpoint() <> "115/#{chamber}/floor_updates.json"
    |> make_request(get_api_header())
  end
end