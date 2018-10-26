defmodule TechTestWeb.Router do
  use TechTestWeb, :router

  @version Mix.Project.config[:version]

  pipeline :api do
    plug :accepts, ["json", "protobuf"]
#    plug PhoenixSwagger.Plug.Validate
  end

  # Scope for API implementation
  scope "/api/v1", TechTestWeb do
    pipe_through :api
    resources "/leagues", LeaguesController, only: [:index]
    resources "/results", ResultsController, only: [:index]
  end

  # Root scope SwaggerUI
  scope "/" do
    options "/", TechTestWeb.OptionsController, :nothing
    forward "/", PhoenixSwagger.Plug.SwaggerUI, otp_app: :tech_test, swagger_file: "swagger.json"
  end

  def swagger_info do
    %{
      info: %{
        version: @version,
        title: "Technical Test Lumenity"
      },
      tags: [%{name: "Leagues", description: "Operations about Leagues"},
             %{name: "Results", description: "Operations about Results"}]
    }
  end
end
