# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :appengine_example, AppengineExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UDPSiS7xiA4czxR0CP43/unnFbYoAvMJtqCoymXJkoicorhOmmLPlNgyNr/8JjdW",
  render_errors: [view: AppengineExampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AppengineExample.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
