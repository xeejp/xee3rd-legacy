defmodule Xee3rd.Router do use Xee3rd.Web, :router
  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Xee3rd do
    pipe_through :browser # Use the default browser stack
    get "/", PageController, :index
    get "/themes", PageController, :themes

    # registration page
    get "/register", RegistrationController, :new
    post "/register", RegistrationController, :create

    # login page
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    get "/logout", SessionController, :delete

    get "/experiment/:expid", ExperimentController, :index
    get "/host/experiment/:expid", ExperimentController, :admin
  end

  scope "/host", Xee3rd do
    pipe_through :browser # Use the default browser stack
    get "/", HostController, :index
    get "/index", HostController, :index
    get "/experiments", HostController, :experiments
    post "/experiments/create", HostController, :create
  end
end
