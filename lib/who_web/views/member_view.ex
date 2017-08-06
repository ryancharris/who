defmodule WhoWeb.MemberView do
  use WhoWeb, :view

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
    Parses out the member_id from the Member JSON blob.

    EX:
      WhoWeb.MemberView.parse_member_id("C001070")
      >>> "C001070"
  """
  @spec parse_member_id(String.t()) :: String.t()
  def parse_member_id(nil), do: nil
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
  def parse_member_votes(nil), do: nil
  def parse_member_votes(member) do
    member
    |> Map.get("votes")
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
    Returns the URL to a Member's official website.

    EX:
      WhoWeb.MemberView.parse_member_website("B001227")
      >>> "www.brady.house.gov"
  """
  @spec parse_member_website(String.t()) :: String.t()
  def parse_member_website(nil), do: nil
  def parse_member_website(member) do
    Map.get(member, "domain")
  end

  @doc """
    Based on the Member's chamber, this function returns the Member's title

    EX:
      WhoWeb.MemberView.parse_member_title("House")
      >>> "Representative"

      WhoWeb.MemberView.parse_member_title("Senate")
      >>> "Senator"
  """
  @spec parse_member_title(String.t()) :: String.t()
  def parse_member_title(chamber) do
    cond do
      String.downcase(chamber) == "house" -> "Representative"
      String.downcase(chamber) == "senate" -> "Senator"
      true -> nil
    end
  end

end
