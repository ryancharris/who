defmodule WhoWeb.RoutesHelper do
  @moduledoc """
  A set of functions used to build and return custom routes and paths.
  """

  @doc """
  Creates a relative path to a Member's profile page by ID.

  EX:
    WhoWeb.RoutesHelper.member_id_path("A000360")
    >>> /member/A000360
  """
  @spec member_id_path(String.t) :: String.t
  def member_id_path(member_id) do
    ~s(/member/#{member_id})
  end

end