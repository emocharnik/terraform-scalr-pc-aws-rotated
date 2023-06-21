variable "vcs_organization" {
  type = string
  description = "The name of organization into which a repository was forked"
}

variable "vcs_name" {
  type = string
  description = "The name of VCS provider that have access to the forked repository"
}

variable "environment_name" {
  type = string
  default = "provider-configurations"
  description = "The name of environment that will manage provider configurations"
}

variable "workspace_name" {
  type = string
  default = "provider-configurations"
  description = "The name of workspace that will manage provider configurations"
}
