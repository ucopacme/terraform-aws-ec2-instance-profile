# terraform-aws-ec2
Terraform AWS EC2-Instance-Profile Module


-->

Terraform module to provision AWS [`EC2-Instance-Profile`]



## Introduction

The module will create:

* EC2 Instance-profile


## Usage
Create terragrunt.hcl config file, copy/past the following configuration.



```hcl

#
# Include all settings from root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}


inputs = {
  enabled = true
  name = "EC2-Instance-Profile-name"
  tags = {
    "ucop:application" = "test"
    "ucop:createdBy"   = "terraform"
    "ucop:environment" = "Prod"
    "ucop:group"       = "test"
    "ucop:source"      = join("/", ["https://github.com/ucopacme/ucop-terraform-config/tree/master/terraform", path_relative_to_include()])
    "Name"             = "test-1"
    "ucop:owner"       = "chs"
  }
}

terraform {
  source = "git::https://git@github.com/ucopacme/terraform-aws-ec2-instance-profile.git//"
  
}