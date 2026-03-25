locals {
  // Step 1 — Build a map of ALL instances with enriched fields.
  // Use a for expression over var.config.instances to produce a map where each value
  // contains the original fields plus: subnet_id, merged security_group_ids, merged tags.
  all_instances = {} # TODO

  // Step 2 — Keep only enabled instances.
  // Use a for expression with an if clause to filter local.all_instances.
  enabled_instances = {} # TODO
}

// Step 3 — Use for_each to dynamically create an instance for each entry in the enabled map.
// This single resource block will produce multiple instances based on the map keys.
resource "terraform_data" "instance" {
  # TODO
}
