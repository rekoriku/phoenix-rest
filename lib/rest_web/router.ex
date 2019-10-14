defmodule RestWeb.Router do
  use RestWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RestWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/json/:id", RestController, :showjson
  end

  scope "/api", RestWeb do
    pipe_through :api
    resources "/courses", CourseController#, expect: [:new, :edit]
    resources "/assignments", AssignmentController
    get "/rest", RestController, :index
    get "/rest/:messenger", RestController, :show
  end
  # Other scopes may use custom stacks.
  # scope "/api", RestWeb do
  #   pipe_through :api
  # end
end
