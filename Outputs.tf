output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "admin01_public_ip" {
  description = "Public IP Address of ADMIN01"
  value       = aws_instance.admin01.public_ip
}

output "admin01_instance_id" {
  value = aws_instance.admin01.id
}

output "admin01_sg_id" {
  value = aws_security_group.admin01_sg.id
}

output "sql01_sg_id" {
  value = aws_security_group.sql01_sg.id
}

output "mail01_sg_id" {
  value = aws_security_group.mail01_sg.id
}

output "sql01_private_ip" {
  value = aws_instance.sql01.private_ip
}

output "sql01_instance_id" {
  value = aws_instance.sql01.id
}

output "mail01_instance_id" {
  description = "MAIL01 Instance ID"
  value       = aws_instance.mail01.id
}

output "mail01_private_ip" {
  description = "MAIL01 Private IP Address"
  value       = aws_instance.mail01.private_ip
}

output "mail01_private_dns" {
  description = "MAIL01 Private DNS Name"
  value       = aws_instance.mail01.private_dns
}

output "mail01_availability_zone" {
  description = "MAIL01 Availability Zone"
  value       = aws_instance.mail01.availability_zone
}
