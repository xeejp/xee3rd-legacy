defmodule Xee3rd.PageControllerTest do
  use Xee3rd.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
