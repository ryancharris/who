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

    render conn, "show.html", bill: bill
  end

end