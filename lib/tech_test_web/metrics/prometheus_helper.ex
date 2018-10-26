defmodule Metrics.PrometheusHelper do
  require Prometheus.Registry

  def unregister_system_collectors() do
    Prometheus.Registry.deregister_collector(:default, :prometheus_vm_memory_collector)
    Prometheus.Registry.deregister_collector(:default, :prometheus_vm_statistics_collector)
    Prometheus.Registry.deregister_collector(:default, :prometheus_vm_system_info_collector)
  end

end
