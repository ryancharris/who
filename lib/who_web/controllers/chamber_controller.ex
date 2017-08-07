defmodule WhoWeb.ChamberController do
  use WhoWeb, :controller

  alias Who.ProPublicaAPI.Bill
  alias Who.ProPublicaAPI.Chamber

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{"chamber" => chamber}) do
    case chamber == "house" || chamber == "senate" do
      false ->
        render conn, WhoWeb.ErrorView, "404.html"
      true ->
        [members | _tail] = Chamber.get_members_by_chamber(chamber)
        [floor_actions | _tail] = Chamber.get_recent_chamber_actions(chamber)
        [bills_passed | _tail] = Bill.get_recent_bills(chamber, "passed")
        [bills_introduced | _tail] = Bill.get_recent_bills(chamber, "introduced")

        raise inspect bills_introduced

        render conn,
          "show.html",
          members: members["members"],
          chamber: members["chamber"],
          bills_passed: bills_passed["bills"],
          bills_introduced: bills_introduced["bills"],
          floor_actions: floor_actions["floor_actions"]
    end
  end
end
