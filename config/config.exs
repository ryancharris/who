# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :who,
  ecto_repos: [Who.Repo]

# Configures the endpoint
config :who, WhoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QTOpXl39oGF2sVBhT1in3Qbo/h88fN/VjJKKXDCU1cXB6M9o6p/rBWJIZGq+ohqQ",
  render_errors: [view: WhoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Who.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
