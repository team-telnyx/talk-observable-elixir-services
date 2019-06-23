defmodule DemoWeb.CallsController do
  use DemoWeb, :controller

  alias Demo.Calls

  alias DemoWeb.FallbackController

  action_fallback FallbackController

  def create(conn, %{"from" => from, "to" => to}) do
    with {:ok, call} <- Calls.dial(%{from: from, to: to}) do
      render(conn, "create.json", call: call)
    end
  end

  def play(conn, %{"id" => id, "url" => url}) do
    with :ok <- Calls.play(%{call_id: id, url: url}) do
      render(conn, "ok.json")
    end
  end
end
