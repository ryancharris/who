defmodule WhoWeb.CommitteePresenter do
  @moduledoc """
  This module organizes and arranges information regarding a
  given Committee to reduce logic in the template.
  """
  alias WhoWeb.CommitteeeView

  @type t :: %__MODULE__{
    id: Sting.t,
    chamber: String.t,
    chair: map,
    members: map,
    hearings: list(map)
  }

  defstruct [
    id: "",
    chamber: "",
    chair: %{},
    members: %{},
    hearings: []
  ]

  @doc """
  Creates a new %CommitteePresenter{} named struct.
  """
  def new(nil, _, _), do: nil
  def new(id, members, hearings) do
    %{
      "chamber" => chamber,
      "current_members" => current_members,
      "chair" => chair_name,
      "chair_id" => chair_id,
      "chair_party" => chair_party,
      "chair_state" => chair_state
    } = members

    %__MODULE__{
      id: id,
      chamber: chamber,
      chair: %{
        id: chair_id,
        name: chair_name,
        party: chair_party,
        state: chair_state
      },
      members: current_members,
      hearings: hearings
    }
  end

end