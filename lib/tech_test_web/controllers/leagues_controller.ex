defmodule TechTestWeb.LeaguesController do

  use TechTestWeb, :controller
  use PhoenixSwagger

  require Prometheus.Metric.Counter
  require Logger

  alias TechTest.ResultProcessor

  def swagger_definitions do
    %{
      League: swagger_schema do
        title "League & Season"
        description "League with Season pair"
        properties do
          div :string, "Division/League", required: true
          season :string, "Season", required: true
        end
        example %{
          div: "SP1",
          season: "201617"
        }
      end,
      LeagueResponse: swagger_schema do
        title "League & Season Response"
        description "Response with League and Season pair"
        type :array
        items Schema.ref(:League)
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
    get "/api/v1/leagues"
    operation_id "get_leagues"
    summary "Get Leagues"
    description "List the league and season pairs (e.g. La Liga 2017-2018) for which there are results available"
    produces "application/json"
    produces "application/x-protobuf"
    response 200, "Success", Schema.ref(:LeagueResponse)
    response 400, "Bad request", Schema.ref(:Error)
  end

  def index(conn, _params) do
    Prometheus.Metric.Counter.inc(:get_league_counter)
    Logger.debug "[get_league] processing"
    resp = ResultProcessor.get_leagues
    json conn, resp
  end

end
