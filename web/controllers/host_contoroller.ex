defmodule Xee3rd.HostController do
  use Xee3rd.Web, :controller
  require Logger

  plug Xee3rd.AuthenticationPlug

  def index(conn, _params) do
    experiment = Xee3rd.HostServer.get(get_session(conn, :current_user))
    render conn, "index.html", experiment: experiment
  end

  def experiments(conn, _params) do
    themes = Xee3rd.ThemeServer.get_all
              |> Map.to_list
              |> Enum.map(fn {_key, value} -> value end)
    render conn, "experiments.html", csrf_token: get_csrf_token(), experiment_name: "", theme_num: "0", themes: themes, user_num: "1", startDateTime: "", endDateTime: "", showDescription: "true", id: Xee3rd.Experiment.generate_id
  end

  def create(conn, %{"experiment_name" => name, "theme" => theme, "user_num" => user_num, "startDateTime" => start_info, "endDateTime" => end_info, "showDescription" => show, "x_id" => x_id}) do
    if (name == nil || name == "") do
      conn
      |> put_flash(:error, "Make Experiment Error")
      |> redirect(to: "/host")
    else
      has   = Xee3rd.HostServer.has?(get_session(conn, :current_user), x_id)
      exist = Xee3rd.ExperimentServer.has?(x_id)
      unless (has || exist) do
        uid = Xee3rd.ExperimentServer.create(x_id, name)
        experiment_info = %{uid: uid, name: name, theme: theme, user_num: user_num, start_info: start_info, end_info: end_info, show: show, x_id: x_id}
        Xee3rd.HostServer.register(get_session(conn, :current_user), experiment_info)
        conn
        |> put_flash(:info, "Made New Experiment : " <> theme)
        |> redirect(to: "/experiment/" <> x_id <> "/host")
      else
        themes = Xee3rd.ThemeServer.get_all
              |> Map.to_list
              |> Enum.map(fn {_key, value} -> value end)
        conn
        |> put_flash(:error, "This ExperimentID is already being used.")
        |> render "experiments.html", csrf_token: get_csrf_token(), experiment_name: name, theme_num: theme, themes: themes, user_num: user_num, startDateTime: start_info, endDateTime: end_info, showDescription: show, id: Xee3rd.Experiment.generate_id
      end
    end
  end
end
