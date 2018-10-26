defmodule TechTest.Repo.Migrations.CreateResult do
  use Ecto.Migration

  def change do
    create table(:result) do
      add :result_id, :integer
      add :div, :string, size: 120
      add :season, :string, size: 6
      add :date, :date
      add :homeTeam, :string
      add :awayTeam, :string
      add :fthg, :integer
      add :ftag, :integer
      add :ftr, :string, size: 1
      add :hthg, :integer
      add :htag, :integer
      add :htr, :string, size: 1
      timestamps()
    end

    create index(:result, [:div, :season])
  end

end
