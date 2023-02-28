resource "aws_launch_configuration" "web" {
  name          = "web_config"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  user_data = var.user_data
  key_name = aws_key_pair.generated_key.key_name
  security_groups = var.security_group
}