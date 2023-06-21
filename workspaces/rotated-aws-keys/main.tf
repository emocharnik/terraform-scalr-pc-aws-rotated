terraform {
  required_providers {
    scalr = {
      source  = "registry.scalr.io/scalr/scalr"
      version = "1.0.3"
    }
  }
}

data "scalr_vcs_provider" "this" {
  name = var.vcs_name
}

resource "scalr_environment" "provider_configurations" {
  name = var.environment_name
}

resource "scalr_workspace" "provider_configurations" {
  name = var.workspace_name
  environment_id = scalr_environment.provider_configurations.id

  vcs_provider_id = data.scalr_vcs_provider.this.id
  working_directory = "modules/provider-configuration-aws"

  vcs_repo {
    identifier = "${var.vcs_organization}/terraform-scalr-pc-aws-rotated"
    branch = "main"
    trigger_prefixes = ["modules/provider-configuration-aws"]
  }
}

resource "scalr_workspace_run_schedule" "rotation" {
  workspace_id = scalr_workspace.provider_configurations.id
  # Each Saturday on 10:00 AM UTC
  apply_schedule = "0 10 * * 6"
}