variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "keypair_name" {
  description = "the name of the .pem file"
  type        = string
  default     = "MyServersKeyPair"
}

variable "project_name" {
  description = "Project Name"
  type        = string
  default     = "windows-lab"
}

variable "home_ip" {
  description = "My home address"
  type        = string
  default     = "71.208.101.13/32"
}

