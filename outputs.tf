output "profile_name" {
  description = "Instance profile name"
  value       = join("", aws_iam_role.this.*.name)
}
