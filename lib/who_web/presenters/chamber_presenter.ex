defmodule WhoWeb.ChamberPresenter do
  @moduledoc """
    Creates a data object containing all the
    important information regarding a Member.
  """
  alias WhoWeb.ChamberView

  @type t :: %__MODULE__{
    chamber_members: list(map),
    chamber: String.t,
    bills_passed: list[map],
    bills_introduced: list(map),
    floor_actions: list(map)
  }

  defstruct [
    chamber_members: [],
    chamber: "",
    bills_passed: [],
    bills_introduced: [],
    floor_actions: []
  ]

  @doc """
    Creates a new %ChamberPresenter{} named struct.
  """
  @spec new(String.t, map, map, map, map) :: t()
  def new(nil, _, _, _, _), do: nil
  def new(chamber, members, bills_passed, bills_introduced, floor_actions) do

    %__MODULE__{
      chamber_members: ChamberView.build_members_list(members),
      chamber: chamber,
      bills_passed: Map.fetch!(bills_passed, "bills"),
      bills_introduced: Map.fetch!(bills_introduced, "bills"),
      floor_actions: Map.fetch!(floor_actions, "floor_actions")
    }
  end
end
