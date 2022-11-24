resource "aws_efs_file_system" "default_efs_file_system" {
  creation_token = "default_efs"

  tags = {
    name = "DefaultEFS"
  }
}

resource "aws_efs_mount_target" "default_efs_mount_target" {
  file_system_id  = aws_efs_file_system.default_efs_file_system.id
  subnet_id       = aws_subnet.sample_public_subnet_1.id
  security_groups = ["${aws_security_group.allow_ssh.id}"]
}

resource "aws_efs_access_point" "default_efs_access_point" {
  file_system_id = aws_efs_file_system.default_efs_file_system.id
}
