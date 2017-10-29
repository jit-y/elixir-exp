defmodule GraphqlWeb.Router do
  use GraphqlWeb, :router

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

  scope "/", GraphqlWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", GraphqlWeb do
    pipe_through :api
    resources "/users", UserController
    resources "/posts", PostController
  end

  forward "/graph", Absinthe.Plug, schema: GraphqlWeb.Schema
  forward "/graphql", Absinthe.Plug.GraphiQL, schema: GraphqlWeb.Schema, interface: :simple
end
