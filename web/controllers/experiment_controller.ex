defmodule Xee3rd.ExperimentController do
  use Xee3rd.Web, :controller

  plug Xee3rd.AuthenticationPlug when action in [:host]

  def index(conn, %{"x_id" => x_id}) do
    if Xee3rd.ExperimentServer.has?(x_id) do
      # TODO : has session, or not
      render conn, "index.html"
    else
      conn
      |> put_flash(:error, "Not Exists Experiment ID")
      |> redirect(to: "/")
    end
  end

  def host(conn, %{"x_id" => x_id}) do
    if Xee3rd.ExperimentServer.has?(x_id) do
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
