defmodule Xee3rd.ExperimentController do
  use Xee3rd.Web, :controller
  require Logger

  plug Xee3rd.AuthenticationPlug when action in [:host]

  def index(conn, %{"x_id" => x_id}) do
    if Xee3rd.ExperimentServer.has?(x_id) do
      if (get_session(conn, x_id) == x_id) do
        if (get_session(conn, :user_id) == nil) do
          put_session(conn, :x_id, x_id)
        end
      else
        put_session(conn, :user_id, "") # Generate unique user id
        put_session(conn, :x_id, x_id)
      end
      render conn, "index.html"
    else
      conn
      |> put_flash(:error, "Not Exists Experiment ID")
      |> redirect(to: "/")
    end
  end

  def host(conn, %{"x_id" => x_id}) do
    experiment = Xee3rd.HostServer.get(get_session(conn, :current_user))
    if experiment do
      experiment = List.first experiment
    end
    equal = experiment[:x_id] == x_id
    if Xee3rd.ExperimentServer.has?(x_id) && equal do
      render conn, "admin.html"
    else
      conn
      |> put_flash(:error, "Not Exists Experiment ID")
      |> redirect(to: "/host")
    end
  end

  def update(conn, %{"x_id" => expid}) do
  end

  def input(conn, %{"x_id" => expid}) do
  end
end
