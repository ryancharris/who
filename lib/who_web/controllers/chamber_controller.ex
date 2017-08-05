defmodule WhoWeb.ChamberController do
  use WhoWeb, :controller

  alias Who.ProPublicaAPI.Chamber

  def show(conn, %{"chamber" => chamber}) do
    [member_list | tail] = Chamber.get_members_by_chamber(chamber)

    case chamber do
      "house" ->
        render conn, "show.html", chamber: "house", members: member_list
      "senate" ->
        render conn, "show.html", chamber: "senate", members: member_list
    end
  end
end