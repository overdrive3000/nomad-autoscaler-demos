variable "owner_name" {
  default = "Juan Mesa"
}
variable "owner_email" {
  default = "jmesa@seatgeek.com"
}
variable "region" {
  default = "us-east-1"
}
variable "subnet_ids" {
  default = [
    "subnet-015595345084746bc",
    "subnet-05e4ec12a9dd7e501",
    "subnet-0ce0e459b0a26eb95"
  ]
}
variable "ami" {
  default = "ami-0f2b66ecbe9cee808"
}
variable "key_name" {
  default = "jmesa-key"
}

variable "stack_name" {
  default = "hashistack"
}

variable "vpc_id" {
  default = "vpc-0b3eba99139f0415c"
}
