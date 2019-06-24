defmodule Demo.TelSwitchClient do
  use Confex, otp_app: :demo
  require Logger

  def dial(%{call: _call, from: _from, to: _to} = data) do
    call("/dial", data)
  end

  def play(%{call: _call, url: _url} = data) do
    call("/play", data)
  end

  defp call(path, data) do
    client("POST #{path}")
    |> Tesla.post(path, data)
    |> parse_response()
  end

  def parse_response({:ok, %{status: 200}}), do: :ok

  def parse_response(error) do
    Logger.info("Service call to tel-switch failed: #{inspect(error)}")
    {:error, %{error: :service_call_failed, service: :tel_switch}}
  end

  def client(operation) do
    [
      {Tesla.Middleware.BaseUrl, base_url()},
      Tesla.Middleware.RequestId,
      Tesla.Middleware.JSON,
      Tesla.Middleware.Logger,
      OpencensusTesla.Middleware,
      {Demo.Metrics.Tesla.Middleware.ServiceCall, %{operation: operation}}
    ]
    |> Tesla.client()
  end

  defp base_url, do: Keyword.fetch!(config(), :base_url)
end
