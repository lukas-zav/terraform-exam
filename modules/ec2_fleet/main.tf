locals {
  # Step 1 — Enrich every instance with resolved subnet_id, merged SGs, and merged tags.
  all_instances = {
    for name, inst in var.config.instances : name => {
      ami                = inst.ami
      instance_type      = inst.instance_type
      subnet_index       = inst.subnet_index
      enabled            = inst.enabled
      associate_eip      = inst.associate_eip
      subnet_id          = var.config.subnet_ids[inst.subnet_index]
      security_group_ids = concat(var.config.common_security_group_ids, inst.security_group_ids)
      tags               = merge(var.config.common_tags, inst.tags, { Name = name })
    }
  }

  # Step 2 — Keep only enabled instances.
  enabled_instances = {
    for name, inst in local.all_instances : name => inst
    if inst.enabled
  }
}

# Step 3 — One resource block; for_each drives one instance per enabled entry.
resource "terraform_data" "instance" {
  for_each = local.enabled_instances

  input = each.value
}
