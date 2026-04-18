terraform {
  required_providers {
    clevercloud = {
      source  = "CleverCloud/clevercloud"
      version = "0.4.1"
    }
    uca = {
      source  = "registry.terraform.io/florian-forestier/uca"
      version = "1.2.2"
    }
    ovh = {
      source  = "ovh/ovh"
      version = "~> 0.40"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.4"
    }
  }
}

provider "clevercloud" {
  organisation = var.CC_ORGANISATION
  token        = var.CC_OAUTH_TOKEN
  secret       = var.CC_OAUTH_SECRET
}

provider "uca" {
  endpoint   = "https://cloud-ui.edu.forestier.re/api/"
  user_token = var.UCA_USER_TOKEN
}

provider "ovh" {
  endpoint           = var.ovh_endpoint
  application_key    = var.ovh_application_key
  application_secret = var.ovh_application_secret
  consumer_key       = var.ovh_consumer_key
}

provider "vault" {
  address          = "https://openbao.edu.forestier.re"
  skip_child_token = true
}
