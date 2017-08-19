defmodule WhoWeb.MemberPresenter do
  @moduledoc """
    Creates a data object containing all the
    important information regarding a Member.
  """
  alias WhoWeb.MemberView

  @type t :: %__MODULE__{
    name: String.t(),
    title: String.t(),
    state: String.t(),
    party: String.t(),
    chamber: String.t(),
    district: non_neg_integer(),

    start_date: String.t(),
    end_date: String. t(),
    member_id: String.t(),
    committees: list(String.t()),
    votes_with_party: float(),
    votes: list(map()),

    website_url: String.t(),
    facebook_url: String.t(),
    twitter_url: String.t(),
    youtube_url: String.t(),
    phone_url: String.t(),
    office: String.t(),

    profile_link: String.t()
  }

  defstruct [
    name: nil,
    title: nil,
    state: nil,
    party: nil,
    chamber: nil,
    district: nil,

    start_date: nil,
    end_date: nil,
    member_id: nil,
    committees: [],
    votes_with_party: nil,
    votes: [],

    website_url: nil,
    facebook_url: nil,
    twitter_url: nil,
    youtube_url: nil,
    phone_url: nil,
    office: nil,
    profile_link: nil
  ]

  @doc """
    Creates a new %MemberPresenter{} named struct.
  """
  @spec new(map()) :: t()
  def new(nil), do: nil
  def new(member, member_votes_map) do
    chamber = MemberView.parse_member_field(member, "roles", "chamber")
    vote_list = MemberView.parse_member_field(member_votes_map, "votes")
    member_id = MemberView.parse_member_field(member, "member_id")

    %__MODULE__{
      name: MemberView.parse_member_name(member),
      title: MemberView.build_member_title(chamber),
      state: MemberView.build_state_name(member),
      party: MemberView.build_member_party(member),
      chamber: chamber,
      district: MemberView.parse_member_district(member, chamber),

      start_date: MemberView.parse_member_start_date(member),
      end_date: MemberView.parse_member_end_date(member),
      member_id: member_id,
      committees: MemberView.build_current_session_committee_list(member),
      votes_with_party: MemberView.build_aggregate_party_vote_pct(member),
      votes: MemberView.build_votes_list(vote_list) |> Enum.slice(1..10),

      website_url: "https://" <> MemberView.parse_member_field(member, "domain"),
      facebook_url: member
                    |> MemberView.parse_member_social_account("facebook")
                    |> MemberView.build_social_profile_url("facebook"),
      twitter_url:  member
                    |> MemberView.parse_member_social_account("twitter")
                    |> MemberView.build_social_profile_url("twitter"),
      youtube_url:  member
                    |> MemberView.parse_member_social_account("youtube")
                    |> MemberView.build_social_profile_url("youtube"),
      phone_url: "tel:1" <> MemberView.parse_member_field(member, "roles", "phone"),
      office: MemberView.parse_member_field(member, "roles", "office"),

      profile_link: ~s(/member/#{member_id})
    }
  end
end
