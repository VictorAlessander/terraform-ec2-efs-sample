resource "aws_key_pair" "keypair" {
  key_name   = "keypair"
  public_key = file("keys/id_rsa.pub")
}
