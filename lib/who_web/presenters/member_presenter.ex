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
    member_id: String.t(),

    website: String.t(),
    facebook_name: String.t(),
  }

  defstruct [
    name: nil,
    title: nil,
    state: nil,
    party: nil,

    start_date: nil,
    end_date: nil,
    member_id: nil,

    website: nil,
    facebook_name: nil,
    chamber: nil,
    district: nil,
  ]

  @spec new(String.t()) :: t()
  def new(nil), do: nil
  def new(member) do
    %__MODULE__{
      name: MemberView.parse_member_name(member),
      title: nil,
      state: nil,
      party: nil,
      chamber: MemberView.parse_member_chamber(member),
      district: nil,

      start_date: nil,
      end_date: nil,
      member_id: MemberView.parse_member_id(member),

      website: nil,
      facebook_name: nil
    }
  end
end
