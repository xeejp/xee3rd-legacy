defmodule Xee3rd.ExperimentController do
  use Xee3rd.Web, :controller

  def student(conn, %{"id" => x_id}) do
    html conn, """
    <html>
      <head>
        <title>student</title>
      </head>
      <body>
        <p>#{x_id}</p>
      </body>
    </html>
    """
  end

  def host(conn, %{"id" => x_id}) do

  end

end
