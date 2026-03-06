# Common Bandwidth Package outputs
output "common_bandwidth_package_id" {
  description = "The ID of the Common Bandwidth Package"
  value       = alicloud_common_bandwidth_package.cbwp.id
}

output "common_bandwidth_package_name" {
  description = "The name of the Common Bandwidth Package"
  value       = alicloud_common_bandwidth_package.cbwp.bandwidth_package_name
}

output "common_bandwidth_package_status" {
  description = "The status of the Common Bandwidth Package"
  value       = alicloud_common_bandwidth_package.cbwp.status
}

output "common_bandwidth_package_create_time" {
  description = "The creation time of the Common Bandwidth Package"
  value       = alicloud_common_bandwidth_package.cbwp.create_time
}

output "common_bandwidth_package_payment_type" {
  description = "The billing type of the Common Bandwidth Package"
  value       = alicloud_common_bandwidth_package.cbwp.payment_type
}

output "common_bandwidth_package_region_id" {
  description = "The region ID of the Common Bandwidth Package"
  value       = alicloud_common_bandwidth_package.cbwp.region_id
}

# EIP attachment outputs
output "eip_attachment_ids" {
  description = "The IDs of the EIP attachments to the Common Bandwidth Package"
  value       = { for k, v in alicloud_common_bandwidth_package_attachment.attachments : k => v.id }
}

output "eip_attachment_status" {
  description = "The status of the EIP attachments to the Common Bandwidth Package"
  value       = { for k, v in alicloud_common_bandwidth_package_attachment.attachments : k => v.status }
}

output "attached_eip_instance_ids" {
  description = "The EIP instance IDs that are attached to the Common Bandwidth Package"
  value       = [for attachment in alicloud_common_bandwidth_package_attachment.attachments : attachment.instance_id]
}