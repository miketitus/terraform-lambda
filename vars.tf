variable "aws_access_key" {
  description = "AWS access key, must pass on command line using -var"
}

variable "aws_secret_key" {
  description = "AWS secret access key, must pass on command line using -var"
}

variable "aws_region" {
  description = "US West Oregon"
  default     = "us-west-2"
}
