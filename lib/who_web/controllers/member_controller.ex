defmodule WhoWeb.MemberController do
  use WhoWeb, :controller

  alias WhoWeb.MemberView
  alias WhoWeb.MemberPresenter
  alias Who.ProPublicaAPI.Member

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{"id" => id}) do
    [member | tail] = Member.get_member_by_id(id)
    [votes | tail] = Member.get_member_votes(id)

    render(
      conn,
      "show.html",
      id: MemberView.parse_member_field(member, "member_id"),
      member: MemberPresenter.new(member),
      vote_list: MemberView.parse_member_field(member, "votes"),
      chamber: MemberView.parse_member_chamber(member)
    )
  end
end
