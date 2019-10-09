# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :rest,
  ecto_repos: [Rest.Repo]

# Configures the endpoint
config :rest, RestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "s64wZoltphsiUun7xTrM2UJCZ7KN6SJIvZdnHuwhtEI4UUfwCjzPXJz5i+/eCIQr",
  render_errors: [view: RestWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Rest.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
