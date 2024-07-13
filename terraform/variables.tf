variable "vpc_name" {
    type = string
    description = "VPC name"
}

variable "vpc_cidr_block" {
    type = string
    description = "VPC CIDR Block"
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    type = list(string)
    description = "Public subnet CIDR"
    default = ["10.0.1.0/24"]
}

variable "private_subnet_cidr" {
    type = list(string)
    description = "Private subnet CIDR"
    default = ["10.0.2.0/24"]
}

variable "AZs" {
    type = list(string)
    description = "Name of Availability Zone"
    default = ["ap-southeast-1a"]
}