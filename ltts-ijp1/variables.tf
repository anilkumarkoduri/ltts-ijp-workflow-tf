variable "aws_region" {
    type        = "string"
    default = "eu-west-1"
    description = "Used AWS Region."
}
variable "aws_access_key" {
    type        = "string"
    description = "The account identification key used by your Terraform client."
}
variable "aws_secret_key" {
    type        = "string"
    description = "The secret key used by your terraform client to access AWS."
}
variable "AMIS" {
  type = "map"
  default = {
    us-west-1 = "ami-08660f1c6fb6b01e7"
    }
}
