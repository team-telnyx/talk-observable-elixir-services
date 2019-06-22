# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config



config :demo_web,
  generators: [context_app: :demo]

# Configures the endpoint
config :demo_web, DemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mixsjto6dsJDrp2Hv9syzi37y+a97JQ6/Vux4WGqs6uytsNWQHiVai2T3ejiNQLc",
  render_errors: [view: DemoWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: DemoWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
