variable "sg_id" {
    description = "SG ID for EC2"
    type = string
}

variable "subnets" {
  description = "Subnet ID for the EC2"
  type = list(string)
}

variable "ec2_names" {
    description = "EC2 names"
    type = list(string)
    default = [ "WebServer1", "WebServer2" ]
}
