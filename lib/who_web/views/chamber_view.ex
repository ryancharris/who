defmodule WhoWeb.ChamberView do
  @moduledoc """
    Helper methods to parse and populate %ChamberPresenter{} fields.
  """
  use WhoWeb, :view

  @doc """
  Takes in member information for a given Chamber, parses it and
  returns a list of maps representing Members of the Chamber

  EX:
    build_members_list()
  """
  @spec build_members_list(map) :: list(map)
  def build_members_list(members) do
    Enum.into(Map.fetch!(members, "members"), [])
  end

end
