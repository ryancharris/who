defmodule WhoWeb.MemberController do
  use WhoWeb, :controller

  alias Who.ProPublicaAPI.Member

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{"id" => id}) do
    [member] = Member.get_member_by_id(id)
    render conn, "show.html", id: id, member: member
  end
end