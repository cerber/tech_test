defmodule TechTest.Result do
  use Ecto.Schema
  import Ecto.Changeset

  schema "result" do
    field :result_id, :integer
    field :div,       :string
    field :season,    :string
    field :date,      :date
    field :homeTeam,  :string
    field :awayTeam,  :string
    field :fthg,      :integer
    field :ftag,      :integer
    field :ftr,       :string
    field :hthg,      :integer
    field :htag,      :integer
    field :htr,       :string
    timestamps()
  end

  @doc false
  def changeset(result, attrs \\ %{}) do
    result
    |> cast(attrs, [:result_id, :div, :season, :date, :homeTeam, :awayTeam, :fthg, :ftag, :ftr, :hthg, :htag, :htr])
    |> validate_required([:result_id, :div, :season, :date, :homeTeam, :awayTeam])
    |> unique_constraint(:result_id)
  end

end
