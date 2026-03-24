locals {
  config = jsondecode(file("${path.module}/inputs.json"))
}

module "ec2_fleet" {
  source = "../"

  config = local.config
}

