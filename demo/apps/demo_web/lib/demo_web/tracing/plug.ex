defmodule DemoWeb.Tracing.Plug do
  use Opencensus.Plug.Trace

  alias DemoWeb.OperationClassifier

  def span_name(conn, _opts) do
    OperationClassifier.classify(conn)
  end
end
