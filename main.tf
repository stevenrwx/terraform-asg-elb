module "vpc" {
  source = "./modules/aws_vpc"

  vpc_cidr_block       = "10.1.0.0/16"
  subnet_public_cidr   = "10.1.1.0/24"
  subnet_public_cidr_2 = "10.1.2.0/24"
  subnet_private_cidr  = "10.1.100.0/24"


}

module "asg" {
   source = "./modules/aws_asg"

   instance_type = "t3.micro"
   min_size = 1
   max_size = 2
   elb_id = module.elb.elb_id
   key_name = "asg_demo"
   vpc_subnets = [module.vpc.private_subnet]
   security_group = module.vpc.security_group_ssh
   user_data = <<-EOF
          #!/bin/bash
          sudo echo "hello, world 1" > index.html
          sudo python3 -m http.server 80 &
          EOF
}

module "elb" {
  source = "./modules/aws_elb"

  subnets = [module.vpc.public_subnet, module.vpc.public_subnet2]
  security_group = module.vpc.security_group_ssh

}