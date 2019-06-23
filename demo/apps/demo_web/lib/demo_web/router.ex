defmodule DemoWeb.Router do
  use DemoWeb, :router

  alias DemoWeb.Plug

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :call_actions do
    plug :api
    plug Plug.AuthorizeCall
  end

  scope "/", DemoWeb do
    pipe_through :api

    get "/health", HealthController, :show
  end

  # Call Control

  scope "/calls", DemoWeb do
    pipe_through :api

    post "/", CallsController, :create
  end

  scope "/calls/:id/actions", DemoWeb do
    pipe_through :call_actions

    post "/play", CallsController, :play
  end

  # Tel Switch

  scope "/tel-switch", DemoWeb do
    pipe_through :api

    post "/dial", TelSwitchController, :dial
    post "/play", TelSwitchController, :play
  end
end
