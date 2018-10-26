defmodule TechTestWeb.ResultsController do

  use TechTestWeb, :controller
  use PhoenixSwagger

  require Prometheus.Metric.Counter
  require Logger

  alias TechTest.ResultProcessor

  def swagger_definitions do
    %{
      Result: swagger_schema do
        title "Result"
        description "Result"
        properties do
          id :string, "Result ID", required: true
          div :string, "Division/League", required: true
          season :string, "Season", required: true
          date :string, "Date", required: true
          homeTeam :string, "Home Team", required: true
          awayTeam :string, "Away Team", required: true
          fthg :integer, "Full Time Home Goals", required: true
          ftag :integer, "Full Time Away Goals", required: true
          ftr :string, "Full Time Result", required: true
          hthg :integer, "Half Time Home Goals", required: true
          htag :integer, "Half Time Home Goals", required: true
          htr :integer, "Half Time Result", required: true
        end
        example %{
          id: "1",
          div: "SP1",
          season: "201617",
          date: "19/08/16",
          homeTeam: "La Coruna",
          awayTeam: "Eibar",
          fthg: 2,
          ftag: 1,
          ftr: "H",
          hthg: 0,
          htag: 0,
          htr: "D"
        }
      end,
      ResultsResponse: swagger_schema do
        title "Results Response"
        description "Response for results"
        properties do
          results Schema.array(:Result)
        end
        example %{}
      end,
      Error: swagger_schema do
        title "Invalid request response"
        description "Response for invalid request"
        properties do
          status :integer, "HTTP status code", required: true
          errors :string, "errors messages", required: false
        end
        example %{
          status: 400,
          errors: "[{\"Required property not found.\", \"#\"}]"
        }
      end
    }

  end

  swagger_path :index do
    get "/api/v1/results"
    operation_id "get_results"
    summary "Get Results"
    description "Fetch the results for a specific league and season pair"
    parameters do
      league :query, :string, "Div/League", required: true
      season :query, :string, "Season", required: true
    end
    produces "application/json"
    response 200, "Success", Schema.ref(:ResultsResponse)
    response 400, "Bad request", Schema.ref(:Error)
  end

  def index(conn, params) do
    Prometheus.Metric.Counter.inc(:get_results_counter)
    Logger.debug "[get_results] processing [#{inspect params}]"
    resp = ResultProcessor.get_results(params["league"], params["season"])
    json conn, resp
  end

end
