defmodule Metrics.CounterInstrumentor do
  use Prometheus.Metric

  @counter name: :get_results_counter, labels: [], help: "total number of GET results requests"
  @counter name: :get_league_counter, labels: [], help: "total number of GET league requests"
end
