defmodule WhoWeb.MemberView do
  @moduledoc """
    Helper methods to parse and populate %MemberPresenter{} fields.
  """
  use WhoWeb, :view

  @doc """
    Extracts a given value from the top level of a Member's JSON blob.

    EX:
      WhoWeb.MemberView.parse_member_field(member, "domain")
      >>> "www.casey.senate.gov"

      WhoWeb.MemberView.parse_member_field(member, "roles", "state")
      >>> "PA"
  """
  @spec parse_member_field(map(), String.t()) :: String.t()
  def parse_member_field(member, key) do
    Map.get(member, to_string(key))
  end

  @spec parse_member_field(map(), String.t(), String.t()) :: String.t()
  def parse_member_field(member, parent_key, nested_key) do
    member
    |> Map.get(parent_key)
    |> Enum.fetch!(0)
    |> Map.get(nested_key)
  end

  @doc """
    Takes a Member's first, middle and last name, returns them as
    a concatenated string.

    EX:
      WhoWeb.MemberView.parse_member_name(member)
      >>> "Robert A. Brady"

      WhoWeb.MemberView.parse_member_name(member)
      >>> "Bob Casey"
  """
  @spec parse_member_name(map()) :: nil | String.t()
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
      WhoWeb.MemberView.parse_member_social_account(member, "facebook")
      >>> "RepRobertBrady"

      WhoWeb.MemberView.parse_member_social_account(member, "twitter")
      >>> "RepBrady"

      WhoWeb.MemberView.parse_member_social_account(member, "youtube")
      >>> "BradyPA01"
  """
  @spec parse_member_social_account(map(), String.t()) :: nil | String.t()
  def parse_member_social_account(nil, _), do: nil
  def parse_member_social_account(member, social_network) do
    parse_member_field(member, "#{social_network}_account")
  end

  @doc """
    Based on the Member's chamber, this function returns the Member's title

    EX:
      WhoWeb.MemberView.build_member_title("House")
      >>> "Representative"

      WhoWeb.MemberView.build_member_title("Senate")
      >>> "Senator"
  """
  @spec build_member_title(String.t()) :: String.t() | nil
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
      WhoWeb.MemberView.build_member_party(member)
      >>> "Independent"

      WhoWeb.MemberView.build_member_party(member)
      >>> "Republican"
  """
  @spec build_member_party(map()) :: nil | String.t()
  def build_member_party(nil), do: nil
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
      WhoWeb.MemberView.build_state_name(member)
      >>> "ME"
  """
  @spec build_state_name(map()) :: nil | String.t()
  def build_state_name(nil), do: nil
  def build_state_name(member) do
    parse_member_field(member, "roles", "state")
  end

  @doc """
    For all Members in the House, this function will return the Member's district number
    (or "At Large" for states with only one Representative).

    For Senators, the return value will be nil.

    EX:
      WhoWeb.MemberView.parse_member_district(member, "Senate")
      >>> nil

      WhoWeb.MemberView.parse_member_district(member, "House")
      >>> "At Large"

      WhoWeb.MemberView.parse_member_district(member, "House")
      >>> "44"
  """
  @spec parse_member_district(map(), String.t()) :: nil | String.t() | non_neg_integer
  def parse_member_district(member, "Senate"), do: nil
  def parse_member_district(member, "House") do
    at_large = parse_member_field(member, "roles", "at_large")

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
      WhoWeb.MemberView.parse_member_start_date(member)
      >>> "2015-06-09"
  """
  @spec parse_member_start_date(map()) :: nil | String.t()
  def parse_member_start_date(nil), do: nil
  def parse_member_start_date(member) do
    date =
      member
      |> Map.get("roles")
      |> Enum.fetch!(-1)
      |> Map.get("start_date")

    String.split(date, "-")
    |> List.first
  end

  @doc """
    Returns the end date for a given Member's current session in Congress.

    EX:
      WhoWeb.MemberView.parse_member_end_date(member)
      >>> "2019-01-03"
  """
  @spec parse_member_end_date(map()) :: nil | String.t()
  def parse_member_end_date(nil), do: nil
  def parse_member_end_date(member) do
    parse_member_field(member, "roles", "end_date")
    |> String.split("-")
    |> List.first
  end

  @doc """
    Calculates the percentage of times a Member has voted with their given
    party by averaging this statistic from each Congressional session
    they've served in.

    EX:
      WhoWeb.MemberView.build_aggregate_party_vote_pct(member)
      # (98.53 + 96.15) / 2 = 97.34
      >>> 97.34
  """
  @spec build_aggregate_party_vote_pct(map()) :: float()
  def build_aggregate_party_vote_pct(member) do
    pct_by_session_list =
      for session <- Map.get(member, "roles"), do: session["votes_with_party_pct"]

    filter_pct_list =
      pct_by_session_list
      |> Enum.filter(fn(x) -> x != nil end)

    Enum.sum(filter_pct_list) / Enum.count(filter_pct_list)
    |> Float.round(2)
  end

  @doc """
    For a given member, return a list of Committee names they're serving on in the
    current session.

    EX:
      WhoWeb.MemberView.build_current_session_committee_list(member)
      >>> ["Committee on Agriculture", "Committee on Armed Services", "Committee on Small Business"]
  """
  @spec build_current_session_committee_list(map()) :: nil | list(String.t())
  def build_current_session_committee_list(nil), do: nil
  def build_current_session_committee_list(member) do
    list_of_committees =
      member
      |> Map.get("roles")
      |> Enum.fetch(0)
      |> elem(1)
      |> Map.get("committees")
  end

  @doc """
    Extracts a list of maps from the Member's votes JSON blob.

    EX:
      WhoWeb.MemberView.build_votes_list(vote_list)
      >>> %{
            date: "2017-07-28",
            description: "Department of Veterans Affairs Bonus Transparency Act",
            is_bill: true,
            number: "S 114",
            position: "Yes",
            time: "12:52:00",
            title: "To authorize appropriations and to appropriate amounts for the
            Veterans Choice Program of the Department of Veterans Affairs, to improve
            hiring authorities of the Department, to authorize major medical facility
            leases, and for other purposes."
          }

  """
  @spec build_votes_list(list()) :: list(map())
  def build_votes_list(vote_list) do
    for vote <- vote_list do
      vote_info =
        %{
          "description" => vote["description"],
          "position" => vote["position"],
          "date" => vote["date"],
          "time" => vote["time"]
        }

      if Map.has_key?(vote, "bill") do
        bill_info =
          vote["bill"]
          |> Map.merge(%{"is_bill" => true})

        Map.merge(vote_info, bill_info)
      end
    end
  end

  @doc """
  Takes in the name of a social network and the Member's username, returns the
  URL to their user profile.

  EX:
    WhoWeb.MemberView.build_social_profile_url("SenSanders", "twitter")
    >>>
  """
  @spec build_social_profile_url(String.t, String.t) :: String.t
  def build_social_profile_url(user_name, network) do
    case String.downcase(network) do
      "facebook" -> ~s(https://www.facebook.com/#{user_name})
      "twitter" -> ~s(https://www.twitter.com/#{user_name})
      "youtube" -> ~s(https://www.youtube.com/#{user_name})
    end

  end
end
