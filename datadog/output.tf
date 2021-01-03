output "datadog_user_ids" {
  value = datadog_user.RoleUpdate.*.id
  description = "A list of users created or updated."
}