# ------------ Scalr variables -------------- #
variable "scalr_environments" {
  type = list(string)
  description = <<EOT
    The list of environments where created provider configuration is available:
    - empty list means it is not available in any environment
    - "*" - means the provider configuration will be available for all environments of the account.
    - also you can specify the list of the environment names to share the configuration with.
    For the sake of simplicity, the provider configuration is available for any environment by default.
    To limit the environments you can list their names there.
  EOT
  default = ["*"]
}

variable "name" {
  type = string
  description = "The provider configuration name."
}

variable "export_shell_variables" {
  description = "Whether the provider configuration values will be exported as shell variables in the run environment."
  type = bool
  default = false
}

# ------------ AWS variables -------------- #
variable "role_name" {
  type = string
  description = "The IAM role to retrieve from the AWS and use to create a provider configuration."
}


variable "principal_username" {
  type = string
  description = "The principal AWS user that is allowed to assume the role. Also, static secrets are created for this user."
}


variable "region" {
  type = string
  default = "us-east-1"
  description = "The region where all AWS resources are deployed"
}

# ------------ Rotation variables -------------- #

variable "rotation_days" {
  type = number
  default = 6
  description = "In how many days secrets should be rotated. To avoid race conditions, keep it less than cron schedule interval."
}

variable "secrets_timeout" {
  type = number
  default = 10
  description = "It take some time before secrets are available. Increase if module fails to create the configuration."
}


variable "external_id" {
  type = string
  description = "The external id required by the AWS role"
}

locals {
  all_environments = toset(var.scalr_environments) == toset(["*"])
  environments = local.all_environments ? var.scalr_environments : data.scalr_environment.available.*.id
}