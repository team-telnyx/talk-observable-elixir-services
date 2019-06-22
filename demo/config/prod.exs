use Mix.Config

config :demo_web, DemoWeb.Endpoint,
  url: [host: "localhost", port: 4000],
  http: [:inet6, port: 4000]

config :logger, level: :info
