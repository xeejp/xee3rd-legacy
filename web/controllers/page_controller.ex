defmodule Xee3rd.PageController do
  use Xee3rd.Web, :controller
  require Logger

  def index(conn, _params) do
    render conn, "index.html"
  end

  def themes(conn, _params) do
    test
    themes = Xee3rd.ThemeServer.get_all
              |> Map.to_list
              |> Enum.map(fn {_key, value} -> value end)
    render conn, "themes.html", themes: themes
  end

  defp test() do
    Logger.debug inspect Xee3rd.ThemeServer.get_all
    Xee3rd.ThemeServer.add :test,  %{name: "Ricardo Comparison Production Theory"}
    Xee3rd.ThemeServer.add :test1, %{name: "Double Auction"}
    #Xee3rd.ExperimentServer.create("a", 12)
  end
end
