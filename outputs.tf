output "profile_name" {
  description = "Instance profile name"
  value       = aws_iam_instance_profile.main.name
}

output "profile_arn" {
  description = "Instance profile name"
  value       = aws_iam_instance_profile.main.arn
}

output "role_arn" {
  description = "Instance role name"
  value       = join("", aws_iam_role.main.*.arn)
}
