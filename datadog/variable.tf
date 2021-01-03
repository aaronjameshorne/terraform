variable "api_key" {
  type        = string
  description = "The datadog api key"
}

variable "app_key" {
  type        = string
  description = "The datadog app key"
}
variable "email" {
  type        = map(string)
  description = "List of email address for user"
}

variable "handle" {
  type        = map(string)
  description = "List of  user handle, must be a valid email."
}

variable "name" {
  type        = list(string)
  description = "List of names for user"
}

variable "access_role" {
  type        = map(string)
  description = "List of names for user"
}