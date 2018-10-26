# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :tech_test,
  ecto_repos: [TechTest.Repo]

# Configures the endpoint
config :tech_test, TechTestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YbN5gnaIW1wvCTOFqTG3VZoeVv9oTM1eH4fNO9pjE1V6Fccnr9N3nQdiBNb/VMzF",
  render_errors: [view: TechTestWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TechTest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configure output filename, router and endpoint modules used to generate the swagger file
config :tech_test, :phoenix_swagger,
  swagger_files: %{
    "priv/static/swagger.json" => [
    router: TechTestWeb.Router, # phoenix routes will be converted to swagger paths
    endpoint: TechTestWeb.Endpoint  # (optional) endpoint config used to set host, port and https schemes.
  ]}

# Add Protocol Buffers Format encoder
config :phoenix, :format_encoders,
  proto: Web.ProtoFormatEncoder

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :mime, :types, %{
  "application/x-protobuf" => ["proto"]
}

config :prometheus, Metrics.PrometheusExporter,
  path: "/metrics",
  format: :text, ## or :protobuf, or :text, :auto
registry: :default, # :septa_custom, :default
auth: false

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
