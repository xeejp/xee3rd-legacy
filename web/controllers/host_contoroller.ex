defmodule Xee3rd.HostController do
  use Xee3rd.Web, :controller
  require Logger

  plug Xee3rd.AuthenticationPlug

  def index(conn, _params) do
    experiment = Xee3rd.HostServer.get(get_session(conn, :current_user))
    Logger.debug inspect experiment
    render conn, "index.html", experiment: experiment
  end

  def experiments(conn, _params) do
    themes = Xee3rd.ThemeServer.get_all
              |> Map.to_list
              |> Enum.map(fn {_key, value} -> value end)
    render conn, "experiments.html", csrf_token: get_csrf_token(), experiment_name: "", theme_num: 0, themes: themes, id: Xee3rd.Experiment.generate_id#id: Xee3rd.ExperimentServer.generate_id
  end

  def create(conn, %{"experiment_name" => name, "theme" => theme, "id" => id}) do
    if (name == nil || name == "") do
      conn
      |> put_flash(:error, "Make Experiment Error")
      |> redirect(to: "/host")
    else
      if Xee3rd.HostServer.get(get_session(conn, :current_user)) do
        Xee3rd.HostServer.drop(get_session(conn, :current_user))
      end
      uid = Xee3rd.ExperimentServer.create(id, name)
      experiment_info = %{uid: uid, name: name, theme: theme, x_id: id}
      Xee3rd.HostServer.register(get_session(conn, :current_user), experiment_info)
      conn
      |> put_flash(:info, "Made New Experiment : " <> theme)
      |> redirect(to: "/experiment/" <> id <> "/host")
    end
  end
end
