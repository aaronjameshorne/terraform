locals {
    service = length(var.service) > 0? var.service: var.app
}
resource "datadog_monitor" "default" {
  count = length(var.name)
  name               = var.name[count.index]
  type               = var.monitorType[var.name[count.index]]
  message            = var.message[var.name[count.index]]


  query = var.query[var.name[count.index]]

  thresholds = {
    ok                = 0
    warning           = 2
    critical          = 90
  }
  include_tags = true
  tags = ["environment:${var.env}", "app:${var.app}", "service:${local.service}"]

}
