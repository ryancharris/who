defmodule WhoWeb.MemberPresenter do
  @typedoc """
    This Presenter creates a data object containing all the
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
    votes_with_party: float(),
    committees: list(map()),

    website: String.t(),
    facebook: String.t(),
    twitter: String.t(),
    youtube: String.t()
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
    votes_with_party: nil,
    committees: [],

    website: nil,
    facebook: nil,
    twitter: nil,
    youtube: nil
  ]

  @spec new(map()) :: t()
  def new(nil), do: nil
  def new(member) do
    chamber = MemberView.parse_member_field(member, "roles", "chamber")

    %__MODULE__{
      name: MemberView.parse_member_name(member),
      title: MemberView.build_member_title(chamber),
      state: MemberView.build_state_name(member),
      party: MemberView.build_member_party(member),
      chamber: chamber,
      district: MemberView.parse_member_district(member, chamber),

      start_date: MemberView.parse_member_start_date(member),
      end_date: MemberView.parse_member_end_date(member),
      member_id: MemberView.parse_member_field(member, "member_id"),
      votes_with_party: MemberView.build_aggregate_party_vote_pct(member),
      committees: MemberView.build_current_session_committee_list(member),

      website: MemberView.parse_member_field(member, "domain"),
      facebook: MemberView.parse_member_social_account(member, "facebook"),
      twitter: MemberView.parse_member_social_account(member, "twitter"),
      youtube: MemberView.parse_member_social_account(member, "youtube")
    }
  end
end
