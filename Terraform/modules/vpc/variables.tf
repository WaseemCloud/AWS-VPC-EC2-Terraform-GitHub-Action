variable "vpc_cidr" {
    description = "VPC CIDR Range"
    type = string 
}

variable "subnet_cidr" {
    description = "Subnet's CIDRs"
    type = list(string)
  
}

variable "subnet_names" {
    description = "Subnets' Names"
    type = list(string)
}