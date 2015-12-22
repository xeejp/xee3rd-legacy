defmodule AssertionTest do
  use ExUnit.Case, async: true
  test "create test" do
    Xee3rd.ExperimentServer.start_link()
    uid = Xee3rd.ExperimentServer.create "testkey", %{name: "test", theme: 1, user_num: 100}
    assert uid
  end
  test "has? test" do
    Xee3rd.ExperimentServer.start_link()
    Xee3rd.create "testkey", %{name: "test", theme: 1, user_num: 100}
    assert Xee3rd.ExperimentServer.has? "testkey"
  end
  test "get_all test" do
    Xee3rd.ExperimentServer.start_link()
    Xee3rd.create "testkey1", %{name: "test1", theme: 1, user_num: 100}
    Xee3rd.create "testkey2", %{name: "test2", theme: 1, user_num: 100}
    assert Map.size(Xee3rd.ExperimentServer.get_all()) == 2
  end
  test "get test" do
    Xee3rd.ExperimentServer.start_link()
    Xee3rd.create "testkey", %{name: "test", theme: 1, user_num: 100}
    assert Xee3rd.ExperimentServer.get "testkey"
  end
  test "remove test" do
    Xee3rd.ExperimentServer.start_link()
    Xee3rd.create "testkey", %{name: "name", theme: 1, user_num: 100}
    Xee3rd.ExperimentServer.remove "testkey"
    assert Xee3rd.ExperimentServer.get("testkey") == nil
  end
end
