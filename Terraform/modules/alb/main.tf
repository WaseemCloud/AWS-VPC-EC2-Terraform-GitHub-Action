resource "aws_lb" "test" {
  name               = "application-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg]
  subnets            = var.subnets
}

# Listener
resource "aws_lb_listener" "Listener" {
  load_balancer_arn = aws_lb.test.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

# Target Group
resource "aws_lb_target_group" "tg" {
  name = "tg"
  port = "80"
  protocol = "HTTP"
  vpc_id = var.vpc_id
}


# Target Group Attachment
## NOTE: We will need 1 Target Group which includes both EC2 instaces, but two Target Group Attachment for each EC2 instance.. ##
resource "aws_lb_target_group_attachment" "tg-attachment" {
    count = length(var.instances)
    target_group_arn = aws_lb_target_group.tg.arn
    target_id = var.instances[count.index]
    port = 80
}