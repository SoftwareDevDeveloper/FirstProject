resource "aws_ecs_cluster" "ecs_sg" {
  name = "white"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_task_definition" "python_app" {
  family = "service"
  container_definitions = jsonencode([
    {
      name      = "first"
      # image     = "public.ecr.aws/s3i9z8k1/python-flask-repo:latest"
      image     =  "02271589/projects"
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 5000
          hostPort      = 5000
        }
      ]
    },
  ])

  task_role_arn = "arn:aws:iam::622658514249:role/ecsTaskExecutionRole"

}

resource "aws_ecs_service" "flask" {
  name            = "flask"
  cluster         = aws_ecs_cluster.ecs_sg.id
  task_definition = aws_ecs_task_definition.python_app.arn
  desired_count   = 1

  load_balancer {
    target_group_arn = aws_lb_target_group.sg_name.arn
    container_name   = "first"
    container_port   = 5000
  }

  deployment_controller {
    type = "ECS"
  }
}
