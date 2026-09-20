resource "aws_instance" "mail01" {
  availability_zone = var.aws_region
  ami               = data.aws_ami.windows2022.id
  instance_type     = "t3.small"
  subnet_id         = aws_subnet.private.id
  vpc_security_group_ids = [
    aws_security_group.mail01_sg.id
  ]
  key_name = var.keypair_name

  tags = {
    Name = "MAIL01"
  }
}