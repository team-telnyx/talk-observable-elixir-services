defmodule DemoWeb.HealthController do
  use DemoWeb, :controller

  def show(conn, _params) do
    render(conn, "show.json")
  end
end
