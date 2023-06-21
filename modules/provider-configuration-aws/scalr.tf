data "scalr_environment" "available" {
  count = local.all_environments ? 0 : length(var.scalr_environments)
  name = var.scalr_environments[count.index]
}

resource "scalr_provider_configuration" "scalr_managed" {
  name                   = var.name
  export_shell_variables = var.export_shell_variables
  environments           = local.environments

  aws {
    credentials_type    = "role_delegation"
    account_type        = "regular"
    trusted_entity_type = "aws_account"
    access_key = aws_iam_access_key.principal.id
    secret_key = aws_iam_access_key.principal.secret

    role_arn = data.aws_iam_role.existing.arn
    external_id = var.external_id
  }
}
