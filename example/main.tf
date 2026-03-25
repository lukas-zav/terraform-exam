locals {
  config = jsondecode(file("${path.module}/inputs.json"))
}

module "ec2_fleet" {
  source = "../modules/ec2_fleet"

  config = local.config
}
