defmodule Xee3rd.UserTest do
  use Xee3rd.ModelCase

  alias Xee3rd.User

  setup do
    Mix.Tasks.Ecto.Migrate.run(["--all", "Xee3rd.Repo"]);

    on_exit fn ->
      Mix.Tasks.Ecto.Rollback.run(["--all", "Xee3rd.Repo"])
    end
  end

  @valid_attrs %{name: "valid_name", password: "valid_password"}
  @valid_attrs2 %{name: "valid_name2", password: "valid_password2"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "create record with valid changeset" do
    changeset = User.changeset(%User{}, @valid_attrs)
    {status, _user} = User.create(changeset, Xee3rd.Repo)
    assert status == :ok
  end

  test "create record with existed changeset" do
    changeset = User.changeset(%User{}, @valid_attrs)
    {status, _user} = User.create(changeset, Xee3rd.Repo)
    assert status == :ok

    # same paramaters
    changeset = User.changeset(%User{}, @valid_attrs)
    {status, _user} = User.create(changeset, Xee3rd.Repo)
    refute status == :ok
  end

  test "create record with other changeset" do
    changeset = User.changeset(%User{}, @valid_attrs)
    {status, _user} = User.create(changeset, Xee3rd.Repo)
    assert status == :ok

    # different paramaters
    changeset = User.changeset(%User{}, @valid_attrs2)
    {status, _user} = User.create(changeset, Xee3rd.Repo)
    assert status == :ok
  end
end
