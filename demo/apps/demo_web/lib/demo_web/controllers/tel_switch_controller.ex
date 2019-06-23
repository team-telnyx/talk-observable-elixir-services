defmodule DemoWeb.TelSwitchController do
  use DemoWeb, :controller

  alias Demo.TelSwitch

  def dial(conn, %{"call" => call, "from" => from, "to" => to}) do
    with :ok <- TelSwitch.dial(%{call: call, from: from, to: to}) do
      render(conn, "ok.json")
    end
  end

  def play(conn, %{"call" => call, "url" => url}) do
    with :ok <- TelSwitch.play(%{call: call, url: url}) do
      render(conn, "ok.json")
    end
  end
end
