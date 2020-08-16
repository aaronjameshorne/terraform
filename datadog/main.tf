# Create a new Datadog user
resource "datadog_user" "RoleUpdate" {

  count = length(var.name)

  email       = var.email[var.name[count.index]]
  handle      = var.handle[var.name[count.index]]
  name        = var.name[count.index]
  access_role = var.access_role[var.name[count.index]]
  
}

