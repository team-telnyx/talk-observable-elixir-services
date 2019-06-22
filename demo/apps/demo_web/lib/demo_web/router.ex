defmodule DemoWeb.Router do
  use DemoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DemoWeb do
    pipe_through :api
  end
end
