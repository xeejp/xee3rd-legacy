defmodule Xee3rd.PageController do
  use Xee3rd.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
