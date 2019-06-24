defmodule Demo.Metrics.Handler.ServiceCall do
  use Prometheus.Metric

  alias Prometheus.Contrib.HTTP
  require Prometheus.Contrib.HTTP

  @histogram_name :service_call_duration_microseconds

  def setup do
    Histogram.declare(
      name: @histogram_name,
      help: "Service call duration in microseconds",
      buckets: HTTP.microseconds_duration_buckets(),
      labels: [:to, :operation, :status_class]
    )

    :telemetry.attach(
      "service-call-prom-handler",
      [:service_call, :call],
      &__MODULE__.handle/4,
      nil
    )
  end

  def handle(
        [:service_call, :call],
        %{duration: duration},
        %{host: host, operation: operation, status: status},
        _config
      ) do
    labels = [host, operation, to_status_class(status)]
    Histogram.observe([name: @histogram_name, labels: labels], duration)
  end

  defp to_status_class(status) when is_integer(status), do: HTTP.status_class(status)
  defp to_status_class(_), do: :error
end
