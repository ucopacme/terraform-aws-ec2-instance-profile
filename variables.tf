variable "name" {
  description = "Prefix (eg. abc) of the instance profile (abcProfile) and role (abcRole) names"
  type        = string
  default     = ""
}

variable "enabled" {
  description = "Toggles attachment of the AmazonSSMManagedInstanceCore policy to allow usage of AWS SSM"
  type        = string
  default     = true
}

variable "path" {
  description = "Path for the instance profile, role and user-managed policy (if any)"
  type        = string
  default     = "/"
}

variable "tags" {
  description = "Tags that should be assigned to the created resources whenever possible"
  type        = map
  default     = {}
}
