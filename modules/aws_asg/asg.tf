resource "aws_autoscaling_group" "asg" {
  name                 = "web_asgroup"
  launch_configuration = aws_launch_configuration.web.name
  min_size             = var.min_size
  max_size             = var.max_size
  vpc_zone_identifier = var.vpc_subnets

  # lifecycle {
  #   prevent_destroy = true
  # }

  tag {
    key                 = "name"
    value               = "web"
    propagate_at_launch = true
  }

}

resource "aws_autoscaling_attachment" "asg_elb" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  elb                    = var.elb_id
}