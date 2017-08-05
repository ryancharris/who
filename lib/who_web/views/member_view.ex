defmodule WhoWeb.MemberView do
  use WhoWeb, :view

  @doc """
    Parses out the Member's chamber from the Member JSON blob.

    EX:
      WhoWeb.MemberView.parse_member_chamber()
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
      WhoWeb.MemberView.parse_member_id("C001070")
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
      WhoWeb.MemberView.parse_member_votes("C001070")
  """
  @spec parse_member_votes(String.t()) :: list()
  def parse_member_votes(member) do
    member
    |> Map.get("votes")
  end

  @doc """
    Takes a Member's first, middle and last name, returns them as
    a concatenated string.

    EX:
      WhoWeb.MemberView.parse_member_name("B001227")
      >>> Robert A. Brady

      WhoWeb.MemberView.parse_member_name("C001070")
      >>> Bob Casey
  """
  @spec parse_member_name(String.t()) :: String.t()
  def parse_member_name(member) do
    case Map.get(member, "middle_name") != nil do
      true ->
        ~s(#{Map.get(member, "first_name")} #{Map.get(member, "middle_name")} #{Map.get(member, "last_name")})
      false ->
        ~s(#{Map.get(member, "first_name")} #{Map.get(member, "last_name")})
    end
  end

end
