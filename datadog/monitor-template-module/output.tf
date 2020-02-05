output "metric_monitor_ids" {
  value = datadog_monitor.default.*.id
  description = "A list of the monitor ids created"
}
