阿里云共享带宽包 (CBWP) Terraform 模块

================================================ 

# terraform-alicloud-cbwp

[English](https://github.com/alibabacloud-automation/terraform-alicloud-cbwp/blob/main/README.md) | 简体中文

在阿里云上创建共享带宽包 (CBWP) 资源的 Terraform 模块。该模块帮助您管理多个 EIP 地址的共享带宽，为您的云基础设施提供经济高效的带宽共享。有关弹性公网IP带宽包的更多信息，请参阅 [什么是共享带宽包](https://www.alibabacloud.com/help/en/eip-bandwidth-plan)。

## 使用方法

该模块提供了一种简单的方法来创建和管理共享带宽包以及 EIP 绑定。您可以使用它在多个 EIP 地址之间共享带宽以优化成本。

```terraform
data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

module "cbwp" {
  source = "alibabacloud-automation/cbwp/alicloud"
  
  common_bandwidth_package_config = {
    bandwidth_package_name = "my-cbwp"
    description            = "生产环境的共享带宽包"
    isp                    = "BGP"
    bandwidth              = 200
    internet_charge_type   = "PayByBandwidth"
    resource_group_id      = data.alicloud_resource_manager_resource_groups.default.ids[0]
    tags = {
      Environment = "production"
      ManagedBy   = "Terraform"
    }
  }
  
  enable_eip_attachment = true
  
  eip_attachment_configs = {
    web_server = {
      instance_id                 = "eip-bp1234567890abcdef"
      bandwidth_package_bandwidth = "100"
      ip_type                     = "EIP"
    }
    api_server = {
      instance_id                 = "eip-bp0987654321fedcba"
      bandwidth_package_bandwidth = "50"
      ip_type                     = "EIP"
    }
  }
}
```

## 示例

* [完整示例](https://github.com/alibabacloud-automation/terraform-alicloud-cbwp/tree/main/examples/complete)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.120.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | >= 1.120.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_common_bandwidth_package.cbwp](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/common_bandwidth_package) | resource |
| [alicloud_common_bandwidth_package_attachment.attachments](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/common_bandwidth_package_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_bandwidth_package_config"></a> [common\_bandwidth\_package\_config](#input\_common\_bandwidth\_package\_config) | Configuration for the Common Bandwidth Package. The attributes 'bandwidth\_package\_name', 'bandwidth', and 'internet\_charge\_type' are required. | <pre>object({<br>    bandwidth_package_name    = string<br>    description               = optional(string, "Common Bandwidth Package created by Terraform")<br>    isp                       = optional(string, "BGP")<br>    bandwidth                 = number<br>    ratio                     = optional(number, null)<br>    internet_charge_type      = string<br>    resource_group_id         = optional(string, null)<br>    security_protection_types = optional(list(string), null)<br>    deletion_protection       = optional(bool, false)<br>    force                     = optional(bool, false)<br>    zone                      = optional(string, null)<br>    tags                      = optional(map(string), {})<br>  })</pre> | n/a | yes |
| <a name="input_eip_attachment_configs"></a> [eip\_attachment\_configs](#input\_eip\_attachment\_configs) | Configuration for EIP attachments to the Common Bandwidth Package. Each key represents a unique identifier for the attachment. | <pre>map(object({<br>    instance_id                 = string<br>    bandwidth_package_bandwidth = optional(string, null)<br>    ip_type                     = optional(string, "EIP")<br>  }))</pre> | `{}` | no |
| <a name="input_enable_eip_attachment"></a> [enable\_eip\_attachment](#input\_enable\_eip\_attachment) | Whether to enable EIP attachment to the Common Bandwidth Package. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_attached_eip_instance_ids"></a> [attached\_eip\_instance\_ids](#output\_attached\_eip\_instance\_ids) | The EIP instance IDs that are attached to the Common Bandwidth Package |
| <a name="output_common_bandwidth_package_create_time"></a> [common\_bandwidth\_package\_create\_time](#output\_common\_bandwidth\_package\_create\_time) | The creation time of the Common Bandwidth Package |
| <a name="output_common_bandwidth_package_id"></a> [common\_bandwidth\_package\_id](#output\_common\_bandwidth\_package\_id) | The ID of the Common Bandwidth Package |
| <a name="output_common_bandwidth_package_name"></a> [common\_bandwidth\_package\_name](#output\_common\_bandwidth\_package\_name) | The name of the Common Bandwidth Package |
| <a name="output_common_bandwidth_package_payment_type"></a> [common\_bandwidth\_package\_payment\_type](#output\_common\_bandwidth\_package\_payment\_type) | The billing type of the Common Bandwidth Package |
| <a name="output_common_bandwidth_package_region_id"></a> [common\_bandwidth\_package\_region\_id](#output\_common\_bandwidth\_package\_region\_id) | The region ID of the Common Bandwidth Package |
| <a name="output_common_bandwidth_package_status"></a> [common\_bandwidth\_package\_status](#output\_common\_bandwidth\_package\_status) | The status of the Common Bandwidth Package |
| <a name="output_eip_attachment_ids"></a> [eip\_attachment\_ids](#output\_eip\_attachment\_ids) | The IDs of the EIP attachments to the Common Bandwidth Package |
| <a name="output_eip_attachment_status"></a> [eip\_attachment\_status](#output\_eip\_attachment\_status) | The status of the EIP attachments to the Common Bandwidth Package |
<!-- END_TF_DOCS -->

## 提交问题

如果您在使用此模块时遇到任何问题，请提交一个 [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) 并告知我们。

**注意：** 不建议在此仓库中提交问题。

## 作者

由阿里云 Terraform 团队创建和维护(terraform@alibabacloud.com)。

## 许可证

MIT 许可。有关完整详细信息，请参阅 LICENSE。

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)