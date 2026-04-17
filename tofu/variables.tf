# ─────────────────────────────────────────────
# Clever Cloud (database)
# ─────────────────────────────────────────────
variable "CC_ORGANISATION" {
  type        = string
  sensitive   = true
  description = "Clever Cloud organisation ID (e.g. user_xxxx-...)"
}

variable "CC_OAUTH_TOKEN" {
  type        = string
  sensitive   = true
  description = "Clever Cloud OAuth token (from browser localStorage)"
}

variable "CC_OAUTH_SECRET" {
  type        = string
  sensitive   = true
  description = "Clever Cloud OAuth secret (from browser localStorage)"
}

# ─────────────────────────────────────────────
# OVH (DNS)
# ─────────────────────────────────────────────
variable "ovh_endpoint" {
  type        = string
  default     = "ovh-eu"
  description = "OVH API endpoint (ovh-eu for Europe)"
}

variable "ovh_application_key" {
  type      = string
  sensitive = true
}

variable "ovh_application_secret" {
  type      = string
  sensitive = true
}

variable "ovh_consumer_key" {
  type      = string
  sensitive = true
}

# ─────────────────────────────────────────────
# SSH (for the VM)
# ─────────────────────────────────────────────
variable "ssh_public_key" {
  type        = string
  sensitive   = true
  description = "Public SSH key to install on the VM"
}

# ─────────────────────────────────────────────
# Project-specific
# ─────────────────────────────────────────────
variable "isima_username" {
  type        = string
  default     = "imrane.moumad"
  description = "ISIMA username (used as DNS subdomain)"
}

variable "vm_name" {
  type        = string
  default     = "imrane-tp-devops"
  description = "Name of the VM on EduInfra"
}

variable "vm_username" {
  type        = string
  default     = "ubuntu"
  description = "Default user on the VM"
}

variable "db_name" {
  type        = string
  default     = "imrane-mysql"
  description = "Name of the MySQL add-on on Clever Cloud"
}

# ─────────────────────────────────────────────
# EduInfra / cloud-ui (UCA provider)
# ─────────────────────────────────────────────
variable "UCA_USER_TOKEN" {
  type        = string
  sensitive   = true
  description = "EduInfra (cloud-ui) API token for the UCA provider"
}