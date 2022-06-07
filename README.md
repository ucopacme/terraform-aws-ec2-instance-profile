# Instance profile with only the default policy to allow usage of AWS SSM
module "ssm_profile" {
  source            = "github.com/jeandek/terraform-aws-ec2-instance-profile"
  name              = "SimpleSSMProfile"
  attach_ssm_policy = true
}

# Instance profile using existing managed policies
module "managed_profile" {
  source      = "github.com/jeandek/terraform-aws-ec2-instance-profile"
  name        = "ManagedPoliciesProfile"
  policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role",
    "arn:aws:iam::123456789012:policy/myPolicyName",
  ]
}

# Instance profile with a custon policy and the CloudWatch agent policy
module "custom_profile" {
  source            = "github.com/jeandek/terraform-aws-ec2-instance-profile"
  name              = "CustomProfile"
  policy_jsons = ["${data.aws_iam_policy_document.example.json}"]
  attach_cwagent_policy = true
}

data "aws_iam_policy_document" "example" {
  statement {
    effect = "Allow"
    actions = ["ec2:DescribeInstances"]
    resources = ["*"]
  }
}
