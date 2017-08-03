defmodule WhoWeb.MemberController do
  use WhoWeb, :controller

  alias Who.ProPublicaAPI.Member

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{"id" => id}) do
    member = Enum.fetch!(Member.get_member_by_id(id), 0)
    votes = Enum.fetch!(Member.get_member_votes(id), 0)

    render conn, "show.html", id: id, member: member, votes: votes
  end
end