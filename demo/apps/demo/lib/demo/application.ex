defmodule Demo.Application do
  use Application

  alias Demo.Metrics

  def start(_type, _args) do
    Metrics.Handler.setup()

    children = []
    Supervisor.start_link(children, strategy: :one_for_one, name: Demo.Supervisor)
  end
end
