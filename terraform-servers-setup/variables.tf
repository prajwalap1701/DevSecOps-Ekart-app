variable "instance_type" {
  default = "t2.medium"
}

variable "volume_size" {
  type    = number
  default = 30
}

variable "public_key" {
  type    = string
  default = "./keys/aws-key.pub"
}
