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

    website: nil,
    facebook: nil,
    twitter: nil,
    youtube: nil
  ]

  @spec new(String.t()) :: t()
  def new(nil), do: nil
  def new(member) do
    chamber = MemberView.parse_member_chamber(member)
    %__MODULE__{
      name: MemberView.parse_member_name(member),
      title: MemberView.parse_member_title(chamber),
      state: nil,
      party: nil,
      chamber: chamber,
      district: nil,

      start_date: nil,
      end_date: nil,
      member_id: MemberView.parse_member_id(member),

      website: MemberView.parse_member_website(member),
      facebook: MemberView.parse_member_social_account(member, "facebook"),
      twitter: MemberView.parse_member_social_account(member, "twitter"),
      youtube: MemberView.parse_member_social_account(member, "youtube")
    }
  end
end
