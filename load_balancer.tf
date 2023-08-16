resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  subnets            = ["${aws_subnet.subnet_public1.id}", "${aws_subnet.subnet_public2.id}"]
  security_groups    = [aws_security_group.alb.id]

  enable_deletion_protection = false

  tags = {
    Environment = "dev"
  }
}

resource "aws_lb_target_group" "sg_name" {
  name        = "flask-app-target-group"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.localvpc.id
}

resource "aws_lb_listener" "sg" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.sg_name.arn
  }
}


resource "aws_lb_listener" "sl" {
  load_balancer_arn = aws_lb.test.arn
  port              = "443"
  protocol          = "HTTPS"
  #ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.sg_name.arn
  }
}














# module "alb" {
#   source  = "terraform-aws-modules/alb/aws"
#   version = "~> 8.0"

#   name = "my-alb"

#   load_balancer_type = "application"

#   vpc_id          = "vpc-0de121ec0ecf8eeb6"
#   subnets         = ["subnet-03d6e0b51125825c8", "subnet-0309b2541304d1f43"]
#   security_groups = ["sg-010220bdb1a875dac"]

#   target_groups = [
#     {
#       name_prefix      = "pref-"
#       backend_protocol = "HTTP"
#       backend_port     = 80
#       target_type      = "instance"
#       targets = {
#         my_target = {
#           target_id = "i-0baa0ca83fd692a22"
#           port      = 80
#         }
#         my_other_target = {
#           target_id = "i-0baa0ca83fd692a22"
#           port      = 8080
#         }
#       }
#     }
#   ]

#   # https_listeners = [
#   #   {
#   #     port            = 443
#   #     protocol        = "HTTPS"
#   #     certificate_arn = "arn:aws:acm:eu-west-1:622658514249:certificate/ca534fd3-96a8-494a-b182-6b71bad9696f"

#   #     target_group_index = 0
#   #   }
#   # ]

#   # http_tcp_listeners = [
#   #   {
#   #     port               = 80
#   #     protocol           = "HTTP"
#   #     target_group_index = 0
#   #   }
#   # ]

#   tags = {
#     Environment = "dev"
#   }
# }