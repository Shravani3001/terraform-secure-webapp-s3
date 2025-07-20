resource "aws_launch_template" "web" {
  name_prefix   = "${var.project_name}-web"
  image_id      = var.ami_id
  instance_type = var.instance_type



  iam_instance_profile {
    name = var.instance_profile_name
  }

  user_data = base64encode(file(var.userdata_path))

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [var.web_sg_id]
  }


    tags = {
      Name = "${var.project_name}-web"
    }
}

resource "aws_autoscaling_group" "web-asg" {
  name                      = "${var.project_name}-asg"
  desired_capacity          = 2
  max_size                  = 3
  min_size                  = 1
  vpc_zone_identifier       = var.private_subnet_ids
  target_group_arns         = [var.target_group_arn]
  health_check_type         = "EC2"
  health_check_grace_period = 60
  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.project_name}-web"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes        = [desired_capacity]
  }
}