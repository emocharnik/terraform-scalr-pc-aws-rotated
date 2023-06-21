terraform {
  required_providers {
    scalr = {
      source  = "registry.scalr.io/scalr/scalr"
      version = "1.0.3"
    }
    toggles = {
      source = "reinoudk/toggles"
      version = "0.3.0"
    }
  }
}