defmodule WhoWeb.StateView do
  @moduledoc """
    Helper methods to parse and populate %StatePresenter{} fields.
  """
  use WhoWeb, :view

  alias Who.ProPublicaAPI.State

  @doc """
  Takes in a State abbreviation and the number of House Representatives that state
  has and retuns them as a list of maps.

  EX:
    WhoWeb.StateView.build_reps_list("WY", 1)
  """
  @spec build_reps_list(String.t, non_neg_integer) :: list(map)
  def build_reps_list(state, num_of_reps) do
    reps_list =
      for district <- 1..num_of_reps do
        [head | _] = State.get_reps_by_state(state, district)
        head
      end
  end
end
