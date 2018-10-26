# TechTest

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `iex -S mix phx.server`
  * Import data from CSV `Mix.Task.run("seed_results", ["./priv/data/data.csv"])`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Prometheus metrics

Prometheus metrics is available on `/metrics` endpoint 

[`localhost/metrics:4000`](http://localhost/metrics:4000)

```
# TYPE get_league_counter counter
# HELP get_league_counter total number of GET league requests
get_league_counter 11
# TYPE get_results_counter counter
# HELP get_results_counter total number of GET results requests
get_results_counter 21
```

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix


