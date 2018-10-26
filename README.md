# TechTest

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Initialize the ecto Repo with `mix ecto.create && mix ecto.migrate && mix run ./priv/repo/seed.exs`
  * Start Phoenix endpoint with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## docker-compose Environment

To start docker-compose environment
  * install docker-compose tools with dependencies i.e. `apt install docker-compose`
  * build application container using `docker-compose build`
  * running the stack `docker-compose up`

Now you can visit [`localhost`](http://localhost) from you browser. The `docker-compose` console shown 
healthcheck OPTIONS requests to application servers. 

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


