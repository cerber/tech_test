defmodule TechTestWeb.ControllerTest do
  use TechTestWeb.ConnCase

  alias TechTest.ResultProcessor

  test "GET /api/v1/leagues", %{conn: conn} do
    conn = get conn, "/api/v1/leagues"
    assert Enum.count(json_response(conn, 200)) == 6
  end

  test "GET /api/v1/results", %{conn: conn} do
    conn = get conn, "/api/v1/leagues"
    [%{"div" => div, "season" => season}|_] = json_response(conn, 200)
    conn = get conn, "/api/v1/results?league=SP1&season=201617"
    assert Enum.count(json_response(conn, 200)) == ResultProcessor.count_results(div, season)
  end

end
