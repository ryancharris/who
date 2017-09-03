defmodule WhoWeb.StateController do
  use WhoWeb, :controller

  alias Who.RepCounts
  alias Who.ProPublicaAPI.State

  alias WhoWeb.StateView

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{"name" => name}) do
    # %{ "results" => senators } = State.get_senators_by_state(name)

    num_of_reps = RepCounts.get_state_rep_count(name)
    reps = StateView.build_reps_list(name, num_of_reps)

    render conn,
          "show.html",
          name: name,
          # senators: senators,
          reps: reps
  end
end
