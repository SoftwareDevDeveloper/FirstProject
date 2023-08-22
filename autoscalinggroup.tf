resource "aws_launch_configuration" "ag_node" {

  image_id                    = var.ec2_ami
  instance_type               = var.ec2_instance_type
  key_name                    = var.ec2_key_name
  security_groups             = [aws_security_group.alb.id]
  user_data                   = "#!/bin/bash\necho ECS_CLUSTER=ecs_sg >> /etc/ecs/ecs.config"
  associate_public_ip_address = true
}

resource "aws_autoscaling_group" "node_poll" {
  desired_capacity          = 1
  max_size                  = 5
  min_size                  = 1
  name                      = "new_poll"
  health_check_grace_period = 300
  health_check_type         = "EC2"
  force_delete              = true
  launch_configuration      = aws_launch_configuration.ag_node.name
  vpc_zone_identifier       = ["${aws_subnet.subnet_public1.id}", "${aws_subnet.subnet_public2.id}"]
  target_group_arns         = [aws_lb_target_group.sg_name.arn]

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = var.default_tags.Name
  }
}

resource "aws_placement_group" "test" {
  name     = "test"
  strategy = "cluster"
}
