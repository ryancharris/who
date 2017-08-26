defmodule WhoWeb.CommitteePresenter do
  @moduledoc """
  This module organizes and arranges information regarding a
  given Committee to reduce logic in the template.
  """
  alias WhoWeb.CommitteeeView

  @type t :: %__MODULE__{
    id: Sting.t,
    chamber: String.t,
    members: map,
    hearings: list(map)
  }

  defstruct [
    id: "",
    chamber: "",
    members: %{},
    hearings: []
  ]

  @doc """
  Creates a new %CommitteePresenter{} named struct.
  """
  def new(nil, _, _), do: nil
  def new(id, members, hearings) do
    %{"chamber" => chamber} = members

    %__MODULE__{
      id: id,
      chamber: chamber,
      members: members,
      hearings: hearings
    }
  end

end