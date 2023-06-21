# Provider configuration AWS: rotated access keys example

The following example shows how to configure a workspace that manages AWS Provider configurations (with static keys inside) and schedules key rotation.
Before you start, forK the repository into your organization.

## Requirements

### Scalr objects

* A VCS provider that has access to the forked repository. Also, the name of the organization where a repo was forked.
* `SCALR_HOSTNAME` AND `SCALR_TOKEN` (Scalr Provider configuration can also be used if a run is executed in a remote workspace)
* `SCALR_ACCOUNT_ID` (required only if running locally, skip if executing in a remote workspace)

### Permissions:

Scalr permissions:
* `accounts:read` at the account-level
* `environments:*` at the account or environment level
* `workspaces:*` at the environment level

