defmodule DemoWeb.FallbackController do
  use DemoWeb, :controller
  alias DemoWeb.ErrorView

  def call(conn, {:error, %{error: :service_call_failed}}) do
    conn
    |> put_status(:service_unavailable)
    |> put_view(ErrorView)
    |> render(:"503")
  end
end
