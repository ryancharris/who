defmodule WhoWeb.MemberController do
  use WhoWeb, :controller

  alias WhoWeb.MemberView

  alias Who.ProPublicaAPI.Member

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{"id" => id}) do
    [member | tail] = Member.get_member_by_id(id)
    [votes | tail] = Member.get_member_votes(id)

    id = MemberView.parse_member_id(member)
    chamber = MemberView.parse_member_chamber(member)
    vote_list = MemberView.parse_member_votes(votes)

    render(
      conn,
      "show.html",
      id: id,
      member: member,
      vote_list: vote_list,
      chamber: chamber
    )
  end
end
