output "instance_ids" {
  description = "Map of instance resource IDs by instance name"
  value       = {} # TODO
}

output "instance_subnet_ids" {
  description = "Map of resolved subnet IDs by instance name"
  value       = {} # TODO
}

output "instance_security_group_ids" {
  description = "Map of final security group lists by instance name"
  value       = {} # TODO
}

output "instance_tags" {
  description = "Map of final tags by instance name"
  value       = {} # TODO
}

output "eip_ids" {
  description = "Map of EIP resource IDs by instance name"
  value       = {} # TODO
}

output "instance_names" {
  description = "List of created instance names"
  value       = [] # TODO
}
