# Complete Example

This example demonstrates the complete usage of the CBWP (Common Bandwidth Package) module.

## What This Example Does

This example creates:
- A Common Bandwidth Package with 100 Mbit/s bandwidth
- Two EIP addresses for demonstration purposes (optional)
- Attachments of the EIP addresses to the Common Bandwidth Package (optional)

## Usage

To run this example:

1. Configure your Alibaba Cloud credentials
2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Plan the deployment:
   ```bash
   terraform plan
   ```

4. Apply the configuration:
   ```bash
   terraform apply
   ```

5. Clean up when done:
   ```bash
   terraform destroy
   ```

## Variables

- `region`: The Alibaba Cloud region to deploy resources in (default: "cn-hangzhou")
- `name`: Name prefix for all resources (default: "terraform-cbwp-example")
- `enable_eip_attachment`: Whether to enable EIP attachment to the Common Bandwidth Package (default: true)
- `create_eip_for_demo`: Whether to create EIP addresses for demonstration purposes (default: true)

## Outputs

- `common_bandwidth_package_id`: The ID of the created Common Bandwidth Package
- `common_bandwidth_package_name`: The name of the Common Bandwidth Package
- `common_bandwidth_package_status`: The status of the Common Bandwidth Package
- `eip_attachment_ids`: The IDs of the EIP attachments
- `attached_eip_instance_ids`: The EIP instance IDs that are attached
- `created_eip_addresses`: The IP addresses of the created EIP instances
- `created_eip_ids`: The IDs of the created EIP instances

## Notes

- This example creates resources that may incur costs in your Alibaba Cloud account
- Make sure to clean up resources after testing to avoid unnecessary charges
- The EIP addresses are created for demonstration purposes and can be disabled by setting `create_eip_for_demo = false`