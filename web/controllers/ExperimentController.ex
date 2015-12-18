defmodule Xee3rd.ExperimentController do
  use Xee3rd.Web, :controller

  def index(conn, %{"expid" => expid}) do
    render conn, "index.html"
  end

  def admin(conn, %{"expid" => expid}) do
    render conn, "admin.html"
  end

  def update(conn, %{"expid" => expid}) do
  end

  def input(conn, %{"expid" => expid}) do
  end
end
