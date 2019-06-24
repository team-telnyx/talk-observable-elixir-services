defmodule DemoWeb.Metrics.OperationClassifier do
  @router DemoWeb.Router

  alias Plug.Conn

  def classify(%Conn{method: method, path_info: path_info}) do
    do_classify(method, path_info)
  end

  @router
  |> apply(:__routes__, [])
  |> Stream.filter(&match?(%{kind: :match}, &1))
  |> Enum.each(fn %{verb: verb, path: path} ->
    method = String.upcase("#{verb}")

    path_info_match_pattern =
      path
      |> String.split("/", trim: true)
      |> Enum.map(fn
        ":" <> _ -> quote(do: _)
        segment -> segment
      end)

    operation = "#{method} #{path}"

    defp do_classify(unquote(method), unquote(path_info_match_pattern)) do
      unquote(operation)
    end
  end)

  defp do_classify(_method, _path_info), do: "unclassified"
end
