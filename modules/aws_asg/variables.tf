variable "instance_type" {
  description = "instance type"
  default = "t2.micro"
}
variable "min_size" {
  description = "min size"
}
variable "max_size" {
  description = "max size"
}
variable "elb_id" {
  description = "elb_id"
}
variable "key_name" {
  description = "key_name"
}
variable "vpc_subnets" {
  description = "key_name"
}
variable "security_group" {
  description = "sg"
}
variable "user_data" {
  description = "user_data"
}