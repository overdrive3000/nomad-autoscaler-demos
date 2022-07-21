terraform {
  required_version = ">= 1.2"

  required_providers {
    aws = {
      version = "~> 4.22"
    }

    nomad = {
      version = "~> 1.4.17"
    }
  }
}

provider "aws" {
  region = var.region
}

provider "nomad" {
  address = "http://${module.hashistack_cluster.server_elb_dns}:4646"
}

module "my_ip_address" {
  source = "matti/resource/shell"

  command = "curl https://ipinfo.io/ip"
}

module "hashistack_cluster" {
  source = "../modules/aws-hashistack"

  owner_name         = var.owner_name
  owner_email        = var.owner_email
  region             = var.region
  subnet_ids         = var.subnet_ids
  ami                = var.ami
  key_name           = var.key_name
  allowlist_ip       = ["${module.my_ip_address.stdout}/32", "10.0.0.0/8"]
  stack_name         = var.stack_name
  vpc_id             = var.vpc_id
}

module "hashistack_jobs" {
  source = "../../../shared/terraform/modules/shared-nomad-jobs"

  nomad_addr = "http://${module.hashistack_cluster.server_elb_dns}:4646"
}
