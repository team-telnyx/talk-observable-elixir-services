defmodule Demo.Metrics.Tesla.Middleware.ServiceCall do
  def call(env, next, %{operation: operation}) do
    start_time = System.monotonic_time()
    response = Tesla.run(env, next)
    duration = System.monotonic_time() - start_time

    :telemetry.execute([:service_call, :call], %{duration: duration}, %{
      host: URI.parse(env.url).host,
      operation: operation,
      status: get_status(response)
    })

    response
  end

  defp get_status({:ok, %{status: status}}), do: status
  defp get_status(_), do: :error
end
