defmodule DemoWeb.CallsView do
  use DemoWeb, :view

  def render("create.json", %{call: %{id: id}}) do
    %{id: id}
  end

  def render("ok.json", _assigns) do
    %{}
  end
end
