defmodule WhoWeb.ChamberController do
  use WhoWeb, :controller

  alias Who.ProPublicaAPI.Bill
  alias Who.ProPublicaAPI.Chamber

  def show(conn, %{"chamber" => chamber}) do
    [members | _tail] = Chamber.get_members_by_chamber(chamber)
    [bills_passed | _tail] = Bill.get_recent_bills(chamber, "passed")
    [bills_introduced | _tail] = Bill.get_recent_bills(chamber, "introduced")

    case chamber do
      "house" ->
        render conn, "show.html",
          members: members,
          bills_passed: bills_passed,
          bills_introduced: bills_introduced
      "senate" ->
        render conn, "show.html",
          members: members,
          bills_passed: bills_passed,
          bills_introduced: bills_introduced
    end
  end
end