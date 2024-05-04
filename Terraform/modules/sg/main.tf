resource "aws_security_group" "allow_tls" {
  name        = "WaseemSG"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "My_Security_Group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
    description = "HTTP"
    security_group_id = aws_security_group.allow_tls.id
    cidr_ipv4         = "0.0.0.0/0"
    from_port         = 80
    ip_protocol       = "tcp"
    to_port           = 80
}
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
    description = "SSH"
    security_group_id = aws_security_group.allow_tls.id
    cidr_ipv4         = "0.0.0.0/0"
    from_port         = 22
    ip_protocol       = "tcp"
    to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
  from_port = 0
  to_port = 0

  tags = {
    Name = "Waseem's-Security-Group"
  }
}
