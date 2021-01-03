variable "app" {
  type    = string
  description = "The application name"
}
variable "datadog_api_key" {
    type    = string
    description = "The datadog api key" 
}
variable "datadog_app_key" {
    type    = string
    description = "The datadog app key" 
}
variable "env" {
  type    = string
  description = "The application environment" 
}
variable "message" {
  type = map(string)
  description = "A map containing a list of messages with the key being the monitor name" 
}
variable "monitorType" {
  type = map(string)
  description = "A map containing a list of monitor types with the key being the monitor name" 
}
variable "name" {
  type    = list
  default = []
  description = "A list of monitor names" 
}
variable "query" {
  type = map(string)
  description = "A map containing a list of queries with the key being the monitor name" 
}
variable "service" {
  type    = string
  default = ""
  description = "The service name; defaults to the application name" 
}
