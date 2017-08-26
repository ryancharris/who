defmodule WhoWeb.BillController do
  use WhoWeb, :controller

  alias Who.ProPublicaAPI.Bill

  alias WhoWeb.BillPresenter

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{"id" => id}) do
    bill =
      Bill.get_bill_by_id(id)
      |> Enum.fetch!(0)
      |> BillPresenter.new

    [ %{"cosponsors" => cosponsors} | _ ] = Bill.get_bill_cosponsors_by_id(id)

    render  conn,
            "show.html",
            bill: bill,
            cosponsors: cosponsors
  end

end