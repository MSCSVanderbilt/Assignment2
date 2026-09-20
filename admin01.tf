resource "aws_instance" "admin01" {
  availability_zone           = var.aws_region
  ami                         = data.aws_ami.windows2022.id
  instance_type               = "t3.small"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.admin01_sg.id]
  associate_public_ip_address = true
  key_name                    = var.keypair_name
  #  user_data = file("../userdata/admin01.ps1")

  tags = {
    Name = "ADMIN01"
  }
}