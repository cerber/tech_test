defmodule TechTestWeb.LeaguesControllerTest do
  use TechTestWeb.ConnCase

  test "GET /api/v1/leagues", %{conn: conn} do
    conn = get conn, "/api/v1/leagues"
    assert json_response(conn, 200) == [%{"div" => "SP1", "season" => "201617"}]
  end

  test "GET /api/v1/results", %{conn: conn} do
    conn = get conn, "/api/v1/results?league=SP1&season=201617"
    assert json_response(conn, 200) == [%{"div" => "SP1", "season" => "201617"}]
  end

end
