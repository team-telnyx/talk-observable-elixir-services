defmodule Demo.TelSwitch do
  alias Demo.Factorial

  def dial(%{call: _call, from: _from, to: _to}) do
    calc_something()
    :ok
  end

  def play(%{call: _call, url: _url}) do
    calc_something()
    :ok
  end

  defp calc_something, do: Factorial.of(10_000)
end
