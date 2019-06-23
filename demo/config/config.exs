use Mix.Config

config :demo, Demo.TelSwitchClient, base_url: {:system, "TEL_SWITCH_BASE_URL"}

config :demo_web,
  generators: [context_app: :demo]

config :demo_web, DemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mixsjto6dsJDrp2Hv9syzi37y+a97JQ6/Vux4WGqs6uytsNWQHiVai2T3ejiNQLc",
  render_errors: [view: DemoWeb.ErrorView, accepts: ~w(json)],
  instrumenters: [DemoWeb.Metrics.PhoenixInstrumenter]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

config :tesla, adapter: Tesla.Adapter.Hackney

import_config "#{Mix.env()}.exs"
