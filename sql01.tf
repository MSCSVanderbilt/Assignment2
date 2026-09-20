resource "aws_instance" "sql01" {
  availability_zone = var.aws_region
  ami               = data.aws_ami.windows2022.id
  instance_type     = "t3.small"
  subnet_id         = aws_subnet.private.id
  vpc_security_group_ids = [
    aws_security_group.sql01_sg.id
  ]

  key_name = var.keypair_name

  tags = {
    Name = "SQL01"
  }
}

resource "aws_ebs_volume" "sql_data" {
  availability_zone = aws_instance.sql01.availability_zone
  size              = 20
  type              = "gp3"

  tags = {
    Name = "SQL01-DATA"
  }
}

resource "aws_volume_attachment" "sql_data_attach" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.sql_data.id
  instance_id = aws_instance.sql01.id
}

