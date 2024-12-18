output "instance_id" {
  value = aws_instance.example_server.id
}

output "public_ip" {
  value = aws_instance.example_server.public_ip
}