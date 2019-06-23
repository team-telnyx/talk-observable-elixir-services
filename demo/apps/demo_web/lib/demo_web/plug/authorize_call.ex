defmodule DemoWeb.Plug.AuthorizeCall do
  alias Demo.Factorial

  def init(opts), do: opts

  def call(conn, _opts) do
    Factorial.of(3_000)
    conn
  end
end
