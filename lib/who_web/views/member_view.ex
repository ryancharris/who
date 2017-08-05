defmodule WhoWeb.MemberView do
  use WhoWeb, :view

  @doc """
    Parses out the Member's chamber from the Member JSON blob.

    EX:
      parse_member_chamber()
  """
  @spec parse_member_chamber(String.t()) :: String.t()
  def parse_member_chamber(member) do
    chamber =
      member
      |> Map.get("roles")
      |> Enum.fetch!(0)
      |> Map.get("chamber")
  end

  @doc """
    Parses out the member_id from the Member JSON blob.

    EX:
      parse_member_id("C001070")
  """
  @spec parse_member_id(String.t()) :: String.t()
  def parse_member_id(member) do
    member
    |> Map.get("member_id")
  end

  @doc """
    Pulls out a list of the Member's votes from the API call
    JSON body.

    EX:
      parse_member_votes("C001070")
  """
  def parse_member_votes(member) do
    member
    |> Map.get("votes")
  end

end
