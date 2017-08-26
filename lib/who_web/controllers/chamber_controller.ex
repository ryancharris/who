defmodule WhoWeb.ChamberController do
  use WhoWeb, :controller

  alias Who.ProPublicaAPI.Bill
  alias Who.ProPublicaAPI.Chamber

  alias WhoWeb.ChamberPresenter

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

        [ %{"committees" => committees} | _ ] = Chamber.get_commitee_info(chamber)

        render conn,
          "show.html",
          chamber_presenter: ChamberPresenter.new(
            members["chamber"],
            members,
            bills_passed,
            bills_introduced,
            floor_actions,
            committees
          )
    end
  end
end
