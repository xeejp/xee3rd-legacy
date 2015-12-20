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
    Xee3rd.ThemeServer.add :test,  %{name: "リカード生産比較", playnum: "2235", lastupdate: "2015/1/1", producer: "hoge", contact: "aaa@aaa", manual: ""}
    Xee3rd.ThemeServer.add :test1, %{name: "ダブルオークション実験", playnum: "345", lastupdate: "2015/1/2", producer: "piyo", contact: "bbb@bbb", manual: "#"}
    Xee3rd.ThemeServer.add :test2, %{name: "公共財実験", playnum: "678", lastupdate: "2015/12/1", producer: "foo", contact: "ccc@ccc", manual: "#"}
    Xee3rd.ThemeServer.add :test3, %{name: "アンケート実験", playnum: "37544",lastupdate: "2015/7/31", producer: "bar", contact: "ddd@ddd", manual: ""}
  end
end
