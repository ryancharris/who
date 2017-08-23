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

  @doc """
  Creates a relative path to a Bill #show page based on bill_id.

  EX:
    WhoWeb.RoutesHelper.bill_id_path("s114")
    >>> /bill/S114
  """
  def bill_id_path(bill_id) do
    ~s(/bill/#{bill_id})
  end

  @doc """
  Creates a relative path to a Committee #show page based on the Committee's code.

  EX:
    WhoWeb.RoutesHelper.bill_id_path("HSAG")
    >>> /committee/hsag
  """
  def committee_code_path(committee_code) do
    ~s(/committee/#{committee_code})
  end

end