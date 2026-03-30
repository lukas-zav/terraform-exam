output "enabled_instances" {
  description = "Map of all enabled instances with their enriched fields"
  value       = local.enabled_instances
}

output "instance_ids" {
  description = "Map of terraform_data resource IDs by instance name"
  value       = { for name, inst in terraform_data.instance : name => inst.id }
}
