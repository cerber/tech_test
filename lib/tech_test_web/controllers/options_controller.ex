defmodule TechTestWeb.OptionsController do
  use TechTestWeb, :controller

  def nothing(conn, _params) do
    conn
    |> send_resp(201, "")
  end

end
