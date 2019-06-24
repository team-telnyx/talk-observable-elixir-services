defmodule DemoWeb.MixProject do
  use Mix.Project

  def project do
    [
      app: :demo_web,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix | Mix.compilers()],
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      mod: {DemoWeb.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:demo, in_umbrella: true},
      {:phoenix, "~> 1.4.7"},
      {:phoenix_pubsub, "~> 1.1"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:prometheus_plugs, "~> 1.1"},
      {:prometheus_phoenix, "~> 1.2"},
      {:opencensus, "~> 0.9.2"},
      {:opencensus_elixir, "~> 0.3.0"},
      {:opencensus_jaeger, "~> 0.0.1"},
      {:opencensus_plug, "~> 0.3.0"},
      {:opencensus_phoenix, "~> 0.2.0"}
    ]
  end

  defp aliases do
    []
  end
end
