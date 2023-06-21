provider "aws" {
  region = var.region
}

data "aws_iam_role" "existing" {
  name = var.role_name
}

data "aws_iam_user" "principal" {
  user_name = var.principal_username
}

# Every N days a new resource will be created...
resource "time_rotating" "example" {
   # rotation_minutes = 1 # uncomment the line for testing purposes
   rotation_days = var.rotation_days
}

# which then updates the leapfrog toggle
resource "toggles_leapfrog" "toggle" {
  trigger = time_rotating.example.rotation_rfc3339
}

resource "aws_iam_access_key" "principal" {
  user = data.aws_iam_user.principal.user_name

  lifecycle {
    # Leapfrog toggle alternates between true and false, resulting in a replace trigger
    replace_triggered_by = [
      toggles_leapfrog.toggle.alpha,
    ]

    # And we always want some credentials to exist, so create before destroy
    create_before_destroy = true
  }

  provisioner "local-exec" {
    command = "sleep ${var.secrets_timeout}"
  }
}
