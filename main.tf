# Common Bandwidth Package Module
# This module creates a Common Bandwidth Package (CBWP) and optionally attaches EIP instances to it

locals {
  # Determine security protection types based on internet charge type
  security_protection_types = var.common_bandwidth_package_config.internet_charge_type == "PayBy95" ? var.common_bandwidth_package_config.security_protection_types : null
}

# Common Bandwidth Package resource
resource "alicloud_common_bandwidth_package" "cbwp" {
  bandwidth_package_name    = var.common_bandwidth_package_config.bandwidth_package_name
  description               = var.common_bandwidth_package_config.description
  isp                       = var.common_bandwidth_package_config.isp
  bandwidth                 = var.common_bandwidth_package_config.bandwidth
  ratio                     = var.common_bandwidth_package_config.ratio
  internet_charge_type      = var.common_bandwidth_package_config.internet_charge_type
  resource_group_id         = var.common_bandwidth_package_config.resource_group_id
  security_protection_types = local.security_protection_types
  deletion_protection       = var.common_bandwidth_package_config.deletion_protection
  force                     = var.common_bandwidth_package_config.force
  zone                      = var.common_bandwidth_package_config.zone
  tags                      = var.common_bandwidth_package_config.tags
}

# Common Bandwidth Package Attachment resources
resource "alicloud_common_bandwidth_package_attachment" "attachments" {
  for_each = var.eip_attachment_configs

  bandwidth_package_id        = alicloud_common_bandwidth_package.cbwp.id
  instance_id                 = each.value.instance_id
  bandwidth_package_bandwidth = each.value.bandwidth_package_bandwidth
  ip_type                     = each.value.ip_type
}