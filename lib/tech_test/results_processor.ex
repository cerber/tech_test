defmodule TechTest.ResultProcessor do
  import Ecto.Query

  require Logger

  alias TechTest.{Repo, Result}

  def get_leagues do
    Repo.all(from(r in Result, distinct: true, select: %{:div => r.div, :season => r.season}))
  end

  def get_results(div, season) do
    # Should use 'select' for mapping to swagger schema result
    Repo.all(
      from(
        r in Result,
        where: r.div == ^div and r.season == ^season,
        select: %{
          :result_id => r.result_id,
          :div => r.div,
          :season => r.season,
          :date => r.date,
          :homeTeam => r.homeTeam,
          :awayTeam => r.awayTeam,
          :fthg => r.fthg,
          :ftag => r.ftag,
          :ftr => r.ftr,
          :hthg => r.hthg,
          :htag => r.htag,
          :htr => r.htr
        }
      )
    )
  end
end
