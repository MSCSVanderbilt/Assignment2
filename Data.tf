data "aws_ami" "windows2022" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name = "name"
    values = [
      "Windows_Server-2022-English-Full-Base-*"
    ]
  }
}