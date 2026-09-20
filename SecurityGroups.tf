resource "aws_security_group" "admin01_sg" {

  name        = "admin01-sg"
  description = "Allow RDP from home"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "RDP from home"

    from_port = 3389
    to_port   = 3389
    protocol  = "tcp"

    cidr_blocks = [var.home_ip]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "admin01-sg"
  }
}

resource "aws_security_group" "sql01_sg" {

  name        = "sql01-sg"
  description = "SQL Server Access"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SQL"

    from_port = 1433
    to_port   = 1433
    protocol  = "tcp"

    security_groups = [
      aws_security_group.admin01_sg.id
    ]
  }

  ingress {
    description = "RDP from ADMIN01"

    from_port = 3389
    to_port   = 3389
    protocol  = "tcp"

    security_groups = [
      aws_security_group.admin01_sg.id
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sql01-sg"
  }
}

resource "aws_security_group" "mail01_sg" {

  name        = "mail01-sg"
  description = "Mail Access"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SMTP"
    from_port   = 25
    to_port     = 25
    protocol    = "tcp"
    security_groups = [
      aws_security_group.admin01_sg.id
    ]
  }

  ingress {
    description = "RDP from ADMIN01"

    from_port = 3389
    to_port   = 3389
    protocol  = "tcp"

    security_groups = [
      aws_security_group.admin01_sg.id
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mail01-sg"
  }
}