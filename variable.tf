variable "ec2_ami" {
  description = "This is a variable to manage ec2 AMI type"
  type        = string
  default     = "ami-06935448000742e6b"
}

variable "ec2_instance_type" {
  description = "This is a variable to manage ec2 instance type"
  type        = string
  default     = "t2.medium"
}

variable "ec2_key_name" {
  description = "This is a variable to manage ec2 key name"
  type        = string
  default     = "test100"
}

variable "default_tags" {
  description = "This is a variable to declared to manage ec2 tags"
  type        = map(any)
  default = {
    "Name"            = "Shegoj DevOps Training Department DEV"
    "Department"         = "DevOps MasterClass 2023"
    "Owner"           = "Mr Segun Ojeleye"
    "No of Students"  = "30"
    "Program status"  = "Online"
    "Weekend program" = "yes"
  }
}






# variable "bucket" {}
# variable "key" {}