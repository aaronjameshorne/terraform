#Define variables
variable "container_name" {
  description = "Name of the container."
  default     = "splunk"
}
variable "image_name" {
  description = "Image for container."
  default     = "splunk:7.3.0"
}
variable "int_port" {
  description = "Internal port for container."
  default     = "8000"
}
variable "ext_port" {
  description = "External port for container."
  default     = "80"
}
