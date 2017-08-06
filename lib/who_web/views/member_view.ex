defmodule WhoWeb.MemberView do
  @moduledoc """
    Helper methods to parse and populate %MemberPresenter{} fields.
  """

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

  @doc """
    Takes the "R" or "D" party flag from the Member JSON blob and
    returns the full party name as a string.

    EX:
      WhoWeb.MemberView.build_member_party("K000383")
      >>> "Independent"

      WhoWeb.MemberView.build_member_party("C001035")
      >>> "Republican"
  """
  @spec build_member_party(String.t()) :: String.t()
  def build_member_party(member) do
    cond do
      String.upcase(Map.get(member, "current_party")) == "R" -> "Republican"
      String.upcase(Map.get(member, "current_party")) == "D" -> "Democrat"
      true -> "Independent"
    end
  end

  @doc """
    Returns the Member's state affiliation as a two character String.

    TODO: Compare this to a map of state abbreviations/names and return
          the full state name instead

    EX:
      WhoWeb.MemberView.build_state_name("C001035")
      >>> "ME"
  """
  @spec build_state_name(String.t()) :: String.t()
  def build_state_name(member) do
    state =
      member
      |> Map.get("roles")
      |> Enum.fetch!(0)
      |> Map.get("state")
  end

  @doc """
    For all Members in the House, this function will return the Member's district number
    (or "At Large" for states with only one Representative).

    For Senators, the return value will be nil.

    EX:
      WhoWeb.MemberView.parse_member_district("C001109", "Senate")
      >>> nil

      WhoWeb.MemberView.parse_member_district("C001109", "House")
      >>> "At Large"

      WhoWeb.MemberView.parse_member_district("B001300", "House")
      >>> "44"
  """
  @spec parse_member_district(String.t(), String.t()) :: nil | non_neg_integer
  def parse_member_district(member, "Senate"), do: nil
  def parse_member_district(member, "House") do
    at_large =
      member
      |> Map.get("roles")
      |> Enum.fetch!(0)
      |> Map.get("at_large")

    case at_large do
      true -> "At Large"
      false ->
        member
        |> Map.get("roles")
        |> Enum.fetch!(0)
        |> Map.get("district")
        |> String.to_integer
    end
  end

  @doc """
    Returns the start date from a given Member's first session in Congress.

    EX:
      WhoWeb.MemberView.parse_member_start_date("K000388")
      >>> "2015-06-09"
  """
  @spec parse_member_start_date(String.t()) :: String.t()
  def parse_member_start_date(nil), do: nil
  def parse_member_start_date(member) do
    member
    |> Map.get("roles")
    |> Enum.fetch!(-1)
    |> Map.get("start_date")
  end

  @doc """
    Returns the end date for a given Member's current session in Congress.

    EX:
      WhoWeb.MemberView.parse_member_end_date("K000388")
      >>> "2019-01-03"
  """
  @spec parse_member_end_date(String.t()) :: String.t()
  def parse_member_end_date(nil), do: nil
  def parse_member_end_date(member) do
    member
    |> Map.get("roles")
    |> Enum.fetch!(0)
    |> Map.get("end_date")
  end

  @doc """
    Calculates the percentage of times a Member has voted with their given
    party by averaging this statistic from each Congressional session
    they've served in.

    EX:
      WhoWeb.MemberView.build_party_vote_pct("K000388")
      (98.53 + 96.15) / 2 = 97.34
      >>> 97.34
  """
  @spec build_party_vote_pct(String.t()) :: float()
  def build_party_vote_pct(member) do
    num_of_sessions =
      Map.get(member, "roles")
      |> Enum.count

    pct_by_session_list =
      for session <- Map.get(member, "roles"), do: session["votes_with_party_pct"]

    Enum.sum(pct_by_session_list) / 2
  end

end
