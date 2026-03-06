variable "region" {
  description = "The Alibaba Cloud region to deploy resources in"
  type        = string
  default     = "cn-hangzhou"
}

variable "name" {
  description = "Name prefix for all resources"
  type        = string
  default     = "terraform-cbwp-example"
}

variable "create_eip_for_demo" {
  description = "Whether to create EIP addresses for demonstration purposes"
  type        = bool
  default     = true
}