# DataDog metric monitor module 

## Purpose 

This can be a standard way of creating datadog metric monitors
Monitor paramerters provide derivative values for tagging

Parameters per monitor are dertermined by monitor name; with the monitorType, message, query, etc being associated with the name in 
corresponding dictionaries

For example, Given the monitor names below:

```
name = [
  "ITOC-errorRate",
  "ITOC-high-cpu"
]
```

There must be keys in the message, monitorType, and query dictionary that correspond to those names:

```

message = {
  "ITOC-errorRate" = "ITOC - Cart - Error rate(s) increasing. Please investigate."
  "ITOC-high-cpu"  = "{{host.name}} / {{host.ip}} Warning level: {{warn_threshold}} Alert level: {{threshold}} Detected value: {{value}}"

}
monitorType = {
  "ITOC-errorRate" = "metric alert"
  "ITOC-high-cpu"  = "metric alert"
}

query = {
  "ITOC-errorRate" = "sum(last_5m):( 100 * avg:trace.servlet.request.errors{env:prod,service:cart}.as_count() ) / avg:trace.servlet.request.hits{env:prod,service:cart}.as_count() > 3"
  "ITOC-high-cpu"  = "avg(last_5m):avg:system.cpu.user{env:prod,app:cart} by {host} + avg:system.cpu.system{env:prod,app:cart} by {host} > 90"
}

```

## Usage 

To use within your application:

```
module "ecs_cluster" {
   source = "git::ssh://git@github.com/Chewy-Inc/chewy-terraform-datadog-metric-monitor.git"

   app              = var.app
   datadog_api_key  = var.datadog_api_key
   datadog_app_key  = var.datadog_app_key
   message          = var.message
   monitorType      = var.monitorType
   name             = var.name
   query            = var.query
   service          = var.service

}

```

## Terraform verson

~>0.12.0


## Providers

| Name | Version |
|------|---------|
| datadog | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| app | The application name | `string` | n/a | yes |
| datadog\_api\_key | The datadog api key | `string` | n/a | yes |
| datadog\_app\_key | The datadog app key | `string` | n/a | yes |
| env | The application environment | `string` | n/a | yes |
| message | A map containing a list of messages with the key being the monitor name | `map(string)` | n/a | yes |
| monitorType | A map containing a list of monitor types with the key being the monitor name | `map(string)` | n/a | yes |
| name | A list of monitor names | `list` | `[]` | no |
| query | A map containing a list of queries with the key being the monitor name | `map(string)` | n/a | yes |
| service | The service name; defaults to the application name | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| metric\_monitor\_ids | A list of the monitor ids created |
