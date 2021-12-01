resource "aws_iam_instance_profile" "this" {
  count = var.enabled ? 1 : 0
  name = var.name
  path = var.path
  role = join("", aws_iam_role.this.*.name)
}

resource "aws_iam_role" "this" {
  count = var.enabled ? 1 : 0
  name               = var.name
  path               = var.path
  description        = "Managed by Terraform"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags               = var.tags
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}


resource "aws_iam_role_policy_attachment" "ssm_policy" {
  count = var.enabled ? 1 : 0
  role       = join("", aws_iam_role.this.*.name)
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}


