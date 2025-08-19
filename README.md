# Terraform S3 Bucket Management with Workspaces

This repository demonstrates how to use Terraform workspaces to manage S3 buckets across different environments (dev, prod).

## How It Works

1. **Workspaces**: The solution uses Terraform workspaces to separate environments
   - `dev` workspace for development resources
   - `prod` workspace for production resources

2. **Bucket Naming**: All bucket names are automatically prefixed with the workspace name
   - Example: `dev_my-bucket`, `prod_my-bucket`

3. **Bucket Management**: 
   - Create buckets by setting `create = true`
   - Delete buckets by setting `create = false`

## Using Terraform Directly

```bash
# Select or create a workspace
terraform workspace select dev  # or prod
terraform workspace new dev     # if it doesn't exist

# Apply with a tfvars file
terraform apply -var-file=terraform.tfvars

# Delete a specific bucket
terraform destroy -target=module.buckets["bucket-name"]
```

## Using GitHub Actions

The repository includes a GitHub Actions workflow that can:

1. Create buckets in a specified environment
2. Delete specific buckets from an environment

To use the workflow:
1. Go to the "Actions" tab
2. Select "Terraform Bucket Management"
3. Click "Run workflow"
4. Fill in the required parameters:
   - Environment: `dev` or `prod`
   - Action: `create-buckets` or `delete-buckets`
   - Bucket config: JSON configuration of buckets
   - Delete bucket: Name of specific bucket to delete (if using delete action)

## Example Bucket Configuration

```json
{
  "my-app-data": {"create": true, "acl": "private"},
  "my-app-logs": {"create": true}
}
```

## Notes

- Bucket names will be prefixed with the workspace name automatically
- When referring to a bucket for deletion, use the name without the prefix
