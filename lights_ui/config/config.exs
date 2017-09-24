# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :lights_ui,
  namespace: LightsUI

# Configures the endpoint
config :lights_ui, LightsUI.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iqLZYuNamd4WuTzyFeZnowKbMKSBILxRT7W5mXDqhLkMArn5YqJVGsrd5IN4TOU1",
  render_errors: [view: LightsUI.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LightsUI.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
