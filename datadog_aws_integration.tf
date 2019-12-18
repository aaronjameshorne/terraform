provider "datadog" {
  version = ">= 1.4, < 1.7"
  api_key = ""
  app_key = ""
}
resource "datadog_integration_aws" "wizmo" {
  account_id = "7"
  role_name  = "DatadogAWSIntegrationRole"
  host_tags = ["app:wizmo", "env:prod"]
}

output "wizmo" {
  value = "${datadog_integration_aws.wizmo.external_id}"
}


