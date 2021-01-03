datadog_api_key = ""
datadog_app_key = ""
message = {
  "ITOC-errorRate" = "ITOC - Cart - Error rate(s) increasing. Please investigate."
  "ITOC-high-cpu"  = "{{host.name}} / {{host.ip}} Warning level: {{warn_threshold}} Alert level: {{threshold}} Detected value: {{value}}"

}
monitorType = {
  "ITOC-errorRate" = ""
  "ITOC-high-cpu"  = "metric alert"
}
name = [
  
  "ITOC-high-cpu"
]

query = {
  "ITOC-errorRate" = ""
  "ITOC-high-cpu"  = "avg(last_5m):avg:system.cpu.user{env:prod,app:cart} by {host} + avg:system.cpu.system{env:prod,app:cart} by {host} > 90"
}
