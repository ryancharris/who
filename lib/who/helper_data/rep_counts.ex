defmodule Who.RepCounts do
  @moduledoc """
  Contains a map with the number of Representatives for each state
  and functions used for parsing the map.
  """
  @reps_count_by_state %{
    "AK" => 1,
    "AL" => 7,
    "AR" => 4,
    "AZ" => 9,
    "CA" => 53,
    "CO" => 7,
    "CT" => 5,
    "DE" => 1,
    "FL" => 27,
    "GA" => 14,
    "HI" => 2,
    "IA" => 4,
    "ID" => 2,
    "IL" => 18,
    "IN" => 9,
    "KS" => 4,
    "KY" => 6,
    "LA" => 6,
    "MA" => 9,
    "MD" => 8,
    "ME" => 2,
    "MI" => 14,
    "MN" => 8,
    "MO" => 8,
    "MS" => 4,
    "MT" => 1,
    "NC" => 13,
    "ND" => 1,
    "NE" => 3,
    "NH" => 2,
    "NJ" => 12,
    "NM" => 3,
    "NV" => 4,
    "NY" => 27,
    "OH" => 16,
    "OK" => 5,
    "OR" => 5,
    "PA" => 18,
    "RI" => 2,
    "SC" => 7,
    "SD" => 1,
    "TN" => 9,
    "TX" => 36,
    "UT" => 3,
    "VA" => 11,
    "VT" => 1,
    "WA" => 10,
    "WI" => 8,
    "WV" => 3,
    "WY" => 1,
  }

  @doc """
  This function returns the number of Representatives for a given state
  by its two character abbreviation.

  EX:
    Who.RepCounts.get_state_rep_count("NJ")
    Who.RepCounts.get_state_rep_count("nj")
  """
  @spec get_state_rep_count(String.t) :: non_neg_integer
  def get_state_rep_count(nil), do: nil
  def get_state_rep_count(state_abbreviation) do
    state_code = String.upcase(state_abbreviation)
    Map.fetch!(@reps_count_by_state, state_code)
  end
end
