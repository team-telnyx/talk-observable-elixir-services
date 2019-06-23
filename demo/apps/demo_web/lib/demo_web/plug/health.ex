defmodule DemoWeb.Plug.Health do
  alias Plug.Conn

  def init(opts), do: opts

  def call(%Conn{path_info: ["health"]} = conn, _opts) do
    conn
    |> Conn.send_resp(200, "")
    |> Conn.halt()
  end

  def call(conn, _opts) do
    conn
  end
end
