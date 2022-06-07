# terraform-aws-ec2-instance-profile

Terraform module to create an instance profile and an IAM role of an EC2 instance. IAM policies can be assigned by passing a list of policy ARNs and/or valid JSON policies as variables. Additionally, there are toggles to add default SSM or CW Agent policies.

## Usage

```hcl
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
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| attach\_cwagent\_policy | Toggles attachment of the CloudWatchAgentServerPolicy policy to allow usage of CloudWatch agent | string | `"false"` | no |
| attach\_ssm\_policy | Toggles attachment of the AmazonSSMManagedInstanceCore policy to allow usage of AWS SSM | string | `"false"` | no |
| name | Prefix \(eg. abc\) of the instance profile \(abcProfile\) and role \(abcRole\) names | string | n/a | yes |
| path | Path for the instance profile, role and user-managed policy \(if any\) | string | `"/"` | no |
| policy\_arns | ARNs of IAM policies for the role | list | `[]` | no |
| policy\_jsons | Valid JSON policies for the role | list | `[]` | no |
| tags | Tags that should be assigned to the created resources whenever possible | map | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| profile\_name | Instance profile name |

## Authors

Module maintained by Jean de Kernier.
