defmodule TechTest.Mixfile do
  use Mix.Project

  def project do
    [
      app: :tech_test,
      version: "0.0.1",
      elixir: "~> 1.6",
      elixirc_paths: elixirc_paths(Mix.env),
      # swagger compiler can't find Elixir.TechTestWeb.Router
      # https://github.com/xerions/phoenix_swagger/issues/176
      # compilers: [:phoenix, :gettext, :phoenix_swagger] ++ Mix.compilers,
      compilers: [:phoenix, :gettext] ++ Mix.compilers() ++ [:phoenix_swagger],
      start_permanent: Mix.env == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {TechTest.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.3.4"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_ecto, "~> 3.2"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.11"},
      {:cowboy, "~> 1.0"},
      {:plug_cowboy, "~> 1.0"},
      {:phoenix_swagger, "~> 0.8"}, # Phoenix Swagger
      {:ex_json_schema, "~> 0.5"},  # optional JSON Schema validator
      {:csv, "~> 2.1.1"},           # CSV Decoding and Encoding for Elixir
      {:exprotobuf, "~> 1.2.9"},    # Protocol Buffers for Elixir
      {:prometheus_plugs, "~> 1.1.5"}, # Phoenix Prometheus plug for store metrics
      {:distillery, "~> 2.0.10"}    # Build releases of project
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "test": ["ecto.create --quiet", "ecto.migrate", "run priv/repo/seeds.exs", "test"]
    ]
  end

end
