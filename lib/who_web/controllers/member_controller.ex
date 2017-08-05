defmodule WhoWeb.MemberController do
  use WhoWeb, :controller

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
      id: member["member_id"],
      member: member,
      votes: votes["votes"]
    )
  end
end