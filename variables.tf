variable "region" {
  default = "eu-west-2"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "pub1_cidr" {
  default = "10.0.1.0/24"
}

variable "sub_ava1" {
  default = "eu-west-2a"
}

variable "pub2_cidr" {
  default = "10.0.2.0/24"
}

variable "sub_ava2" {
  default = "eu-west-2b"
}

variable "pri1_cidr" {
  default = "10.0.3.0/24"
}

variable "pri2_cidr" {
  default = "10.0.4.0/24"
}

variable "pub_route_cidr" {
  default = "0.0.0.0/0"
}
