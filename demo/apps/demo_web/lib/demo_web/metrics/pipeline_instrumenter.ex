defmodule DemoWeb.Metrics.PipelineInstrumenter do
  use Prometheus.PlugPipelineInstrumenter

  alias DemoWeb.Metrics.OperationClassifier

  def label_value(:operation, conn) do
    OperationClassifier.classify(conn)
  end
end
