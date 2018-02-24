defmodule Who.Jobs do
  alias Who.Repo

  alias Who.Member
  alias Who.Bill

  def update_bills_table do
    [%{"bills" => house_bills}] = Who.ProPublicaAPI.Bill.get_recent_bills("house", "introduced")
    [%{"bills" => senate_bills}] = Who.ProPublicaAPI.Bill.get_recent_bills("senate", "introduced")
    bills = house_bills ++ senate_bills

    for b <- bills do
      IO.inspect "*************************"
      IO.inspect b["house_passage"]
      IO.inspect b["senate_passage"]
      IO.inspect "*************************"

      bill = %Bill{
        bill_id: b["bill_id"],
        type: b["bill_type"],
        number: b["number"],
        title: b["title"],
        summary: b["summary"],
        json_uri: b["bill_url"],

        introduced: b["introduced_date"],
        last_vote: b["last_vote"],
        last_action_date: b["latest_major_action_date"],
        last_action: b["latest_major_action"],

        sponsor_title: b["sponsor_title"],
        sponsor_name: b["sponsor_name"],
        sponsor_id: b["sponsor_id"],
        num_of_cosponsors: b["cosponsors"],
        num_of_dem_cosponsors: b["cosponsors_by_party"]["D"],
        num_of_rep_cosponsors: b["cosponsors_by_party"]["R"],

        active: b["active"],
        passed_house: b["house_passage"],
        passed_senate: b["senate_passage"],
      }

      Repo.insert!(bill)
    end
  end

  def update_members_table do
    # Clear current records from table
    Repo.delete_all(Who.Member)

    # Make API calls for Sens. & Reps. and concat into list
    [%{"members" => senators}] = Who.ProPublicaAPI.Chamber.get_members_by_chamber("senate")
    [%{"members" => reps}] = Who.ProPublicaAPI.Chamber.get_members_by_chamber("house")
    members = senators ++ reps

    # Create new Members and insert them into the DB
    for member <- members do
      chamber = if(member["short_title"] == "Rep.", do: "house", else: "senate")
      district = parse_district(member["district"])

      rep = %Member{
        member_id: member["id"],

        short_title: member["short_title"],
        first_name: member["first_name"],
        middle_name: member["middle_name"],
        last_name: member["last_name"],

        state: member["state"],
        party: member["party"],
        votes_with_party: member["votes_with_party"],
        chamber: chamber,
        district: district,
        office: member["office"],

        url: member["url"],
        twitter_account: member["twitter_account"],
        facebook_account: member["facebook_account"],
        youtube_account: member["youtube_account"],
      }

      Repo.insert!(rep)
    end
  end

  @spec parse_district(String.t | nil) :: String.t | nil
  defp parse_district(district) do
    case district do
      nil -> nil
      _ -> district
    end
  end
end
