# Example usage of the CBWP (Common Bandwidth Package) module

terraform {
  required_version = ">= 1.0"
}

provider "alicloud" {
  region = var.region
}

# Get available resource groups
data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

# Create EIP addresses for demonstration
resource "alicloud_eip_address" "example" {
  count = var.create_eip_for_demo ? 2 : 0

  bandwidth            = "5"
  internet_charge_type = "PayByTraffic"
  address_name         = "${var.name}-eip-${count.index + 1}"

  tags = {
    Name        = "${var.name}-eip-${count.index + 1}"
    Environment = "example"
    ManagedBy   = "Terraform"
  }
}

# Use the CBWP module
module "cbwp" {
  source = "../../"

  common_bandwidth_package_config = {
    bandwidth_package_name = var.name
    description            = "Example Common Bandwidth Package created by Terraform"
    isp                    = "BGP"
    bandwidth              = 100
    internet_charge_type   = "PayByBandwidth"
    resource_group_id      = data.alicloud_resource_manager_resource_groups.default.ids[0]
    deletion_protection    = false
    tags = {
      Name        = var.name
      Environment = "example"
      ManagedBy   = "Terraform"
    }
  }


  eip_attachment_configs = {
    eip1 = {
      instance_id                 = alicloud_eip_address.example[0].id
      bandwidth_package_bandwidth = "50"
      ip_type                     = "EIP"
    }
    eip2 = {
      instance_id                 = alicloud_eip_address.example[1].id
      bandwidth_package_bandwidth = "30"
      ip_type                     = "EIP"
    }
  }
}