defmodule WhoWeb.MemberView do
  use WhoWeb, :view

  @doc """
    Extracts a given value from the top level of a Member's JSON blob.

    EX:
      WhoWeb.MemberView.parse_member_field("C001070", "domain")
      >>> "www.casey.senate.gov"
  """
  @spec parse_member_field(String.t(), String.t()) :: String.t()
  def parse_member_field(member, field) do
    Map.get(member, to_string(field))
  end

  @doc """
    Parses out the Member's chamber from the Member JSON blob.

    EX:
      WhoWeb.MemberView.parse_member_chamber("C001070")
      >>> "Senate"
  """
  @spec parse_member_chamber(String.t()) :: String.t()
  def parse_member_chamber(nil), do: nil
  def parse_member_chamber(member) do
    chamber =
      member
      |> Map.get("roles")
      |> Enum.fetch!(0)
      |> Map.get("chamber")
  end

  @doc """
    Takes a Member's first, middle and last name, returns them as
    a concatenated string.

    EX:
      WhoWeb.MemberView.parse_member_name("B001227")
      >>> "Robert A. Brady"

      WhoWeb.MemberView.parse_member_name("C001070")
      >>> "Bob Casey"
  """
  @spec parse_member_name(String.t()) :: String.t()
  def parse_member_name(nil), do: nil
  def parse_member_name(member) do
    case Map.get(member, "middle_name") != nil do
      true ->
        ~s(#{Map.get(member, "first_name")} #{Map.get(member, "middle_name")} #{Map.get(member, "last_name")})
      false ->
        ~s(#{Map.get(member, "first_name")} #{Map.get(member, "last_name")})
    end
  end

  @doc """
    Returns a Member's handle for a given social media network.

    EX:
      WhoWeb.MemberView.parse_member_social_account("B001227", "facebook")
      >>> "RepRobertBrady"

      WhoWeb.MemberView.parse_member_social_account("B001227", "twitter")
      >>> "RepBrady"

      WhoWeb.MemberView.parse_member_social_account("B001227", "youtube")
      >>> "BradyPA01"
  """
  @spec parse_member_social_account(String.t(), String.t()) :: String.t()
  def parse_member_social_account(nil, _), do: nil
  def parse_member_social_account(member, social_network) do
    Map.get(member, "#{social_network}_account")
  end

  @doc """
    Based on the Member's chamber, this function returns the Member's title

    EX:
      WhoWeb.MemberView.build_member_title("House")
      >>> "Representative"

      WhoWeb.MemberView.build_member_title("Senate")
      >>> "Senator"
  """
  @spec build_member_title(String.t()) :: String.t()
  def build_member_title(chamber) do
    cond do
      String.downcase(chamber) == "house" -> "Representative"
      String.downcase(chamber) == "senate" -> "Senator"
      true -> nil
    end
  end

  def build_member_party(member) do
    cond do
      String.upcase(Map.get(member, "current_party")) == "R" -> "Republican"
      String.upcase(Map.get(member, "current_party")) == "D" -> "Democrat"
      true -> nil
    end
  end

end
