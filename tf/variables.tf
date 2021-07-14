variable "region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-1"
}

variable "profile" {
  description = "AWS Profile"
  type        = string
  default     = ""
}
variable "env_prefix" {
  description = "Namin gprefix"
  type        = string
  default     = "demo"
}
variable "tags" {
  description = "resource tags"
  type        = map(any)
  default = {
    CostCentre  = "common"
    Project     = "demo"
    Description = "Demonstration"
    Owner       = "Jason"
  }
}
