defmodule WhoWeb.Router do
  use WhoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WhoWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get "/member", MemberController, :index
    get "/member/:id", MemberController, :show 

  end

  # Other scopes may use custom stacks.
  # scope "/api", WhoWeb do
  #   pipe_through :api
  # end
end
