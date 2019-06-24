defmodule DemoWeb.Tracing.RequestIdPlug do
  alias Plug.Conn
  @behaviour Plug

  def init(opts) do
    Keyword.get(opts, :http_header, "x-request-id")
  end

  def call(conn, req_id_header) do
    request_id = Logger.metadata()[:trace_id]
    Conn.put_resp_header(conn, req_id_header, request_id)
  end
end
