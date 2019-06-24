defmodule Demo.MixProject do
  use Mix.Project

  def project do
    [
      app: :demo,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Demo.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:uuid, "~> 1.1"},
      {:tesla, "~> 1.2"},
      {:tesla_request_id, "~> 0.2.0"},
      {:hackney, "~> 1.15"},
      {:confex, "~> 3.4"},
      {:telemetry, "~> 0.4.0"},
      {:prometheus, "~> 4.4"}
    ]
  end

  defp aliases do
    []
  end
end
