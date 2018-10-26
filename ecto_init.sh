#!/bin/bash

set -e

# Initialize the ecto Repo
mix ecto.create
mix ecto.migrate
mix run ./priv/repo/seeds.exs
