
resource "aws_launch_template" "presentation_tier" {
  name = "presentation_tier"

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = 8
    }
  }

  key_name      = "key-aws-n.verginia"
  instance_type = "t2.nano"
  image_id      = "ami-0a2fa960a903b0ff1"

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.presentation_tier.id]
  }

  user_data = base64encode(templatefile("web.sh", {
    application_load_balancer = aws_lb.application_tier.dns_name,
    region                    = "us-east-1"
  }))

  depends_on = [
    aws_lb.application_tier
  ]
}

resource "aws_launch_template" "application_tier" {
  name = "application_tier"

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = 8
    }
  }

  key_name      = "key-aws-n.verginia"
  instance_type = "t2.micro"
  image_id      = "ami-074db809ae7d1d5c0"

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.application_tier.id]
  }

  user_data = base64encode(templatefile("app.sh", {
    rds_hostname = module.rds.rds_address,
    rds_username = var.rds_db_admin,
    rds_password = var.rds_db_password,
    rds_port     = 3306,
    rds_db_name  = var.db_name

    region = "us-east-1"
  }))

  depends_on = [
    aws_nat_gateway.gw
  ]
}