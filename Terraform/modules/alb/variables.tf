variable "sg" {
    description = "Security Group ID for App Load Balancer"
    type = string
}

variable "subnets" {
    description = "Subnets for ALB"
    type = list(string)
}

variable "vpc_id" {
    description = "VPC id for the Load Balancer"
    type = string
}

variable "instances" {
  description = "instances_id for target group attachment"
  type = list(string)
}