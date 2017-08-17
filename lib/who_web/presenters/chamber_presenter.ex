defmodule WhoWeb.ChamberPresenter do
  @moduledoc """
    Creates a data object containing all the
    important information regarding a Member.
  """
  alias WhoWeb.ChamberView

  @type t :: %__MODULE__{
    chamber_members: list(map),
    chamber: String.t
  }

  defstruct [
    chamber_members: [],
    chamber: ""
  ]

  @doc """
    Creates a new %ChamberPresenter{} named struct.
  """
  @spec new(String.t, map, map, map, map) :: t()
  def new(nil, _, _, _, _), do: nil
  def new(chamber, members, bills_passed, bills_introduced, floor_actions) do

    %__MODULE__{
      chamber_members: ChamberView.build_members_list(members),
      chamber: chamber
    }
  end
end
