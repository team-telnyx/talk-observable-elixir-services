defmodule Demo.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = []

    Supervisor.start_link(children, strategy: :one_for_one, name: Demo.Supervisor)
  end
end
