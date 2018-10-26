defmodule Mix.Tasks.SeedResults do
  use Mix.Task

  def store_it(row) do
    changeset = TechTest.Result.changeset(%TechTest.Result{}, row)
    TechTest.Repo.insert!(changeset)
  end

  # Ecto :date type can be a tuple with {year, month, day} as integers or binaries nor "22/08/16"
  def to_ectodate(s) do
    {dd, mm, yy} = String.split(s, "/") |> Enum.map(&String.to_integer/1) |> List.to_tuple
    %{year: 2000 + yy, month: mm, day: dd}
  end

  def run([filename|_] = args) when is_list(args), do: run(filename)
  def run(filename) when is_bitstring(filename) do
    # :ok = Ecto.Adapters.SQL.Sandbox.mode(TechTest.Repo, :manual)
    File.stream!(filename)
    |> Stream.drop(1)
    |> CSV.decode(
      headers: [
        :result_id,
        :div,
        :season,
        :date,
        :homeTeam,
        :awayTeam,
        :fthg,
        :ftag,
        :ftr,
        :hthg,
        :htag,
        :htr
      ]
    )
    |> Enum.map(fn {:ok, row} -> Map.update!(row, :date, &(to_ectodate(&1))) end)
    # |> Enum.take(10)
    # |> IO.inspect
    |> Enum.each(&store_it/1)
  end

  def run(_args) do
    Mix.Shell.IO.error("Results csv dataset required")
  end
end
