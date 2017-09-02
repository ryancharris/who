defmodule Who.ProPublicaAPI.State do
  @moduledoc """
  This module contains methods used for querying the ProPublica API for information
  regarding a given state and its Members.
  """
  import Who.ProPublicaAPI.Base

  @doc """
  Returns a list of maps containing information about the Senators
  from a given State.

  EX:
    Who.ProPublicaAPI.State.get_senators_by_state("wv")
  """
  @spec get_senators_by_state(String.t) :: list
  def get_senators_by_state(state) do
    get_api_endpoint() <> "members/senate/#{state}/current.json"
    |> make_request(get_api_header())
  end

  @spec get_reps_by_state(String.t, non_neg_integer) :: map
  def get_reps_by_state(_, nil), do: nil
  def get_reps_by_state(state, district) do

  end
end
