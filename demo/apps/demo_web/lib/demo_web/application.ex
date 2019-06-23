defmodule DemoWeb.Application do
  use Application

  alias DemoWeb.Metrics

  def start(_type, _args) do
    Metrics.PhoenixInstrumenter.setup()
    Metrics.PipelineInstrumenter.setup()
    Metrics.Exporter.setup()

    children = [
      DemoWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: DemoWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    DemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
