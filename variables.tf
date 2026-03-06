variable "common_bandwidth_package_config" {
  description = "Configuration for the Common Bandwidth Package. The attributes 'bandwidth_package_name', 'bandwidth', and 'internet_charge_type' are required."
  type = object({
    bandwidth_package_name    = string
    description               = optional(string, "Common Bandwidth Package created by Terraform")
    isp                       = optional(string, "BGP")
    bandwidth                 = number
    ratio                     = optional(number, null)
    internet_charge_type      = string
    resource_group_id         = optional(string, null)
    security_protection_types = optional(list(string), null)
    deletion_protection       = optional(bool, false)
    force                     = optional(bool, false)
    zone                      = optional(string, null)
    tags                      = optional(map(string), {})
  })
}

variable "eip_attachment_configs" {
  description = "Configuration for EIP attachments to the Common Bandwidth Package. Each key represents a unique identifier for the attachment."
  type = map(object({
    instance_id                 = string
    bandwidth_package_bandwidth = optional(string, null)
    ip_type                     = optional(string, "EIP")
  }))
  default = {}
}