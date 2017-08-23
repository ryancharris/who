defmodule WhoWeb.CommitteeController do
  use WhoWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  # def show(conn, %{"code" => code}) do
  # end

end
