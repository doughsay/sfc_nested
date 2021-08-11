# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :sfc_nested, SfcNestedWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "I1Q77L6sctE05SiYIHeIrmcwQ4dDbw25uP8kADODiPF7X4pVMbuHaVKl8vY/n7yW",
  render_errors: [view: SfcNestedWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: SfcNested.PubSub,
  live_view: [signing_salt: "G+KRAuoZ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
