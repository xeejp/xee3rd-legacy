defmodule Xee3rd.HostController do
  use Xee3rd.Web, :controller

  plug Xee3rd.AuthenticationPlug

  def index(conn, _params) do
    render conn, "index.html"
  end

  def experiments(conn, _params) do
    themes = Xee3rd.ThemeServer.get_all
              |> Map.to_list
              |> Enum.map(fn {_key, value} -> value end)
    render conn, "experiments.html", csrf_token: get_csrf_token(), experiment_name: "", theme_num: 0, themes: themes, id: Xee3rd.Experiment.generate_id#id: Xee3rd.ExperimentServer.generate_id
  end

  #def create(conn, %{"_csrf_token" => token, "experimentName" => name, "experimentTheme" => theme}) do
    def create(conn, %{"experiment_name" => name, "theme" => theme, "id" => id}) do
    # 入力チェック　（エラーならindex.htmlにエラーをつけて返す)
    if (name == nil) do
      render conn, "index.html", error: "Create Experiment Error!"
    else
      #Xee.3rd.HostServer.register(theme, Xee3rd.ExperimentServer.create_experiment(key, experiment_id, experiment))
      #conn |> redirect(Router.root_path) |> id
    end
    render conn, "index.html"
  end
end
