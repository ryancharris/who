defmodule Who.Jobs do
  alias Who.Repo

  alias Who.Member
  alias Who.ProPublicaAPI.Chamber

  def update_members_table do
    # Clear current records from table
    Repo.delete_all(Who.Member)

    # Make API calls for Sens. & Reps. and concat into list
    [%{"members" => senators}] = Chamber.get_members_by_chamber("senate")
    [%{"members" => reps}] = Chamber.get_members_by_chamber("house")
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
