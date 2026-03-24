output "instance_ids" {
  value = module.ec2_fleet.instance_ids
}

output "instance_subnet_ids" {
  value = module.ec2_fleet.instance_subnet_ids
}

output "instance_security_group_ids" {
  value = module.ec2_fleet.instance_security_group_ids
}

output "instance_tags" {
  value = module.ec2_fleet.instance_tags
}

output "eip_ids" {
  value = module.ec2_fleet.eip_ids
}

output "instance_names" {
  value = module.ec2_fleet.instance_names
}
