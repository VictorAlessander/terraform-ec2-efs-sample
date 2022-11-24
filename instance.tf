resource "aws_instance" "example" {
  ami                         = "ami-01b996646377b6619"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.sample_public_subnet_1.id
  vpc_security_group_ids      = ["${aws_security_group.allow_ssh.id}"]
  key_name                    = aws_key_pair.keypair.key_name
  user_data                   = data.template_file.startup.rendered
  associate_public_ip_address = true
}

output "ip" {
  value = aws_instance.example.public_ip
}
