output "common_bandwidth_package_id" {
  description = "The ID of the Common Bandwidth Package"
  value       = module.cbwp.common_bandwidth_package_id
}

output "common_bandwidth_package_name" {
  description = "The name of the Common Bandwidth Package"
  value       = module.cbwp.common_bandwidth_package_name
}

output "common_bandwidth_package_status" {
  description = "The status of the Common Bandwidth Package"
  value       = module.cbwp.common_bandwidth_package_status
}

output "eip_attachment_ids" {
  description = "The IDs of the EIP attachments to the Common Bandwidth Package"
  value       = module.cbwp.eip_attachment_ids
}

output "attached_eip_instance_ids" {
  description = "The EIP instance IDs that are attached to the Common Bandwidth Package"
  value       = module.cbwp.attached_eip_instance_ids
}

output "created_eip_addresses" {
  description = "The IP addresses of the created EIP instances for demonstration"
  value       = var.create_eip_for_demo ? alicloud_eip_address.example[*].ip_address : []
}

output "created_eip_ids" {
  description = "The IDs of the created EIP instances for demonstration"
  value       = var.create_eip_for_demo ? alicloud_eip_address.example[*].id : []
}