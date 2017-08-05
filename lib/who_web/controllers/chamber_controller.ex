defmodule WhoWeb.ChamberController do
  use WhoWeb, :controller

  alias Who.ProPublicaAPI.Member

  def show(conn, %{"chamber" => chamber}) do
    case chamber do
      "house" ->
        render conn, "show.html", chamber: "house"
      "senate" ->
        render conn, "show.html", chamber: "senate"
    end
  end
end