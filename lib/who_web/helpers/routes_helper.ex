defmodule WhoWeb.RoutesHelper do
  @moduledoc """
  A set of functions used to build and return custom routes and paths.
  """

  def member_id_path(member_id) do
    ~s(/member/#{member_id})
  end

end