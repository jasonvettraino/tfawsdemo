variable "region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-1"
}

variable "profile" {
  description = "AWS Profile"
  type        = string
  default     = "Capgemini-Terraform"
}
variable "aws_access_key" {
  description = "AWS Profile"
  type        = string
  default     = ""
}
variable "aws_secret_key" {
  description = "AWS Profile"
  type        = string
  default     = ""
}
variable "env_prefix" {
  description = "Naming prefix"
  type        = string
  default     = "demo2"
}
variable "tags" {
  description = "resource tags"
  type        = map(any)
  default = {
    CostCentre  = "common"
    Project     = "demo2"
    Description = "Demonstration"
    Owner       = "Jason"
  }
}
