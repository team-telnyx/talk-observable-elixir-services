defmodule Demo.Calls do
  require Logger
  alias Demo.{Factorial, TelSwitchClient}

  import Opencensus.Trace

  def dial(%{from: from, to: to}) do
    call_id = generate_call_id()

    calc_something()

    with :ok <- TelSwitchClient.dial(%{call: call_id, from: from, to: to}) do
      {:ok, %{id: call_id}}
    end
  end

  def play(%{call_id: call_id, url: url}) do
    logger_metadata = Logger.metadata()
    tracing_ctx = :ocp.current_span_ctx()
    tracing_tags = :ocp.current_tags()

    play_task =
      Task.async(fn ->
        Logger.metadata(logger_metadata)
        :ocp.with_span_ctx(tracing_ctx)
        :ocp.with_tags(tracing_tags)

        TelSwitchClient.play(%{call: call_id, url: url})
      end)

    calc_something()
    Task.await(play_task)
  end

  defp generate_call_id, do: UUID.uuid4()

  defp calc_something do
    with_child_span "heavy-calculation", %{"calculating" => "something"} do
      Logger.info("Calculating something...")
      Factorial.of(5_000)
      Logger.info("Calculating something... DONE")
    end
  end
end
