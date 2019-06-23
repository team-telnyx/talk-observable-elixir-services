defmodule Demo.Calls do
  alias Demo.{Factorial, TelSwitchClient}

  def dial(%{from: from, to: to}) do
    call_id = generate_call_id()

    calc_something()

    with :ok <- TelSwitchClient.dial(%{call: call_id, from: from, to: to}) do
      {:ok, %{id: call_id}}
    end
  end

  def play(%{call_id: call_id, url: url}) do
    play_task =
      Task.async(fn ->
        TelSwitchClient.play(%{call: call_id, url: url})
      end)

    calc_something()
    Task.await(play_task)
  end

  defp generate_call_id, do: UUID.uuid4()

  defp calc_something, do: Factorial.of(5_000)
end
