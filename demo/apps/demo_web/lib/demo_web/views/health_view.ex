defmodule DemoWeb.HealthView do
  use DemoWeb, :view

  def render("show.json", _assigns) do
    %{health: "ok"}
  end
end
