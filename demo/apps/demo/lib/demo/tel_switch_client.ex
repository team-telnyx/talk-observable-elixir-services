defmodule Demo.TelSwitchClient do
  use Confex, otp_app: :demo

  def dial(%{call: _call, from: _from, to: _to} = data) do
    call("/dial", data)
  end

  def play(%{call: _call, url: _url} = data) do
    call("/play", data)
  end

  defp call(path, data) do
    client()
    |> Tesla.post(path, data)
    |> parse_response()
  end

  def parse_response({:ok, %{status: 200}}), do: :ok

  def parse_response(_error) do
    {:error, %{error: :service_call_failed, service: :tel_switch}}
  end

  def client do
    [
      {Tesla.Middleware.BaseUrl, base_url()},
      Tesla.Middleware.JSON
    ]
    |> Tesla.client()
  end

  defp base_url, do: Keyword.fetch!(config(), :base_url)
end
