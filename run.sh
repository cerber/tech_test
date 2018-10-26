#!/bin/sh
set -e

# Initialize ecto Repo
mix ecto.create
mix ecto.migrate
mix run ./priv/repo/seeds.exs

# Run Phoenix Server
mix phx.server