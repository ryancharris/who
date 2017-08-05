defmodule WhoWeb.ChamberController do
  use WhoWeb, :controller

  alias Who.ProPublicaAPI.Bill
  alias Who.ProPublicaAPI.Chamber

  def show(conn, %{"chamber" => chamber}) do
    [members | _tail] = Chamber.get_members_by_chamber(chamber)
    [bills_passed | _tail] = Bill.get_recent_bills(chamber, "passed")
    [bills_introduced | _tail] = Bill.get_recent_bills(chamber, "introduced")

    case chamber == "house" || chamber == "senate" do
      true ->
        render conn, "show.html",
          members: members["members"],
          chamber: members["chamber"],
          bills_passed: bills_passed["bills"],
          bills_introduced: bills_introduced["bills"]
      false ->
        # TODO: send this to fallback router path
        IO.puts "There is no such chamber of Congress!"
    end
  end
end