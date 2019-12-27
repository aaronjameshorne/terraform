provider "datadog" {
  version = ">= 1.4, < 1.7"
  api_key = ""
  app_key = ""
}
resource "datadog_integration_aws" "app" {
  account_id = "7"
  role_name  = "DatadogAWSIntegrationRole"
  host_tags = ["app:value", "env:prod"]
}

output "app" {
  value = "${datadog_integration_aws.app.external_id}"
}


