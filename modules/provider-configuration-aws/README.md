# Provider configuration AWS: Trusted entity type AWS account (user-managed)

This module helps users to create an AWS provider configuration in [Scalr](https://scalr.com).


## Requirements

The module expects the AWS IAM role and user to be created and configured before the module is executed.

### Configuration:

* AWS access and secret key (skip if running on the privileged AWS instance)
* `SCALR_HOSTNAME` AND `SCALR_TOKEN` (Provider configuration Scalr can also be used if a run is executed in the remote workspace)
* `SCALR_ACCOUNT_ID` (required only if running locally, skip if executing in the remote workspace)

### AWS objects

* Existing AWS IAM user (variable `principal_username`)
* Existing AWS IAM role (variable `role_name`)

### AWS permission
* Reading IAM users 
* Reading IAM roles
* Management of IAM security credentials

### Scalr objects
* Existing Scalr environments if you want to limit the availability of the provider configuration

### Scalr permissions
* `accounts:read` at the account-level
* `environments:read` at the account or environment levels
* `cloud-credentials:*` at the account-level
