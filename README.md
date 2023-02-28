# terraform-asg-elb

## Infrastructure components
main.tf contains the vpc, asg and elb configuration

- VPC: 2 public subnets and 1 private subnet using natgateway for internet connectivity outbound
- ASG: creates 1 ec2 instance in private subnet with port 80 & 22 open also sshkey is created
- elb: routes traffic from internet to private subnet

## Terraform modules
located in the ./modules path

## Useful commands
- `"sudo make install"` shows the expected output of 18 resources
- `"sudo make install-approve"` 
- `"sudo make destroy"`

## expected results
- private EC2 instance available hosting on port 80 for "hello world 1"
- Can SSH with named sshkey to private instance through the elb dns
