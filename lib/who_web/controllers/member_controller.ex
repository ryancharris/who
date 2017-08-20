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
    [member_votes_map | tail] = Member.get_member_votes(id)

    render(
      conn,
      "show.html",
      member: MemberPresenter.new(member, member_votes_map),
      member_pic: Who.UsProjectAPI.Base.get_member_picture(id, '450')
    )
  end
end
