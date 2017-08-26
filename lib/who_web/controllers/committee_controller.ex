defmodule WhoWeb.CommitteeController do
  use WhoWeb, :controller

  alias Who.ProPublicaAPI.Committee
  alias WhoWeb.CommitteePresenter

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{"id" => id}) do
    case id |> String.downcase |> String.slice(0..0) do
      "s" ->
        chamber = "senate"
      "h" ->
        chamber = "house"
    end

    [ committee_members | _ ] = Committee.get_commitee_info(chamber, id)
    [ committee_hearings | _ ] = Committee.get_committee_hearings(chamber, id)
    %{"hearings" => hearings} = committee_hearings

    # render  conn,
    #         "show.html",
    #         chamber: String.capitalize(chamber),
    #         committee: id,
    #         hearings: hearings,
    #         committee_members: committee_members

    render  conn,
            "show.html",
            committee: CommitteePresenter.new(
              id,
              committee_members,
              hearings
            )
  end

  # def show(conn, %{"code" => code}) do
  # end

end
