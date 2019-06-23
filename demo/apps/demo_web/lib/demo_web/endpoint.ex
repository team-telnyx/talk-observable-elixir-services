defmodule DemoWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :demo_web

  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug DemoWeb.Plug.Health
  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride

  plug DemoWeb.Router
end
