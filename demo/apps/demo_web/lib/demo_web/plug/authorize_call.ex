defmodule DemoWeb.Plug.AuthorizeCall do
  require Logger
  alias Demo.Factorial

  def init(opts), do: opts

  def call(conn, _opts) do
    Logger.info("Authorizing call usage...")
    Factorial.of(3_000)
    conn
  end
end
