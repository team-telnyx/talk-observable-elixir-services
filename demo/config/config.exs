use Mix.Config

config :demo, Demo.TelSwitchClient, base_url: {:system, "TEL_SWITCH_BASE_URL"}

config :demo_web,
  generators: [context_app: :demo]

config :demo_web, DemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mixsjto6dsJDrp2Hv9syzi37y+a97JQ6/Vux4WGqs6uytsNWQHiVai2T3ejiNQLc",
  render_errors: [view: DemoWeb.ErrorView, accepts: ~w(json)],
  instrumenters: [
    DemoWeb.Metrics.PhoenixInstrumenter,
    OpencensusPhoenix.Instrumenter
  ]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:trace_id, :span_id]

config :phoenix, :json_library, Jason

config :tesla, adapter: Tesla.Adapter.Hackney

config :prometheus, DemoWeb.Metrics.PipelineInstrumenter, labels: [:operation, :status_class]

config :opencensus,
  sampler: {:oc_sampler_always, []},
  reporters: [
    {:oc_reporter_jaeger, [service_name: to_charlist(System.get_env("SERVICE_NAME"))]}
  ]

import_config "#{Mix.env()}.exs"
