data "template_file" "startup" {
  template = file("startup.sh")

  vars = {
    efs_id = "${aws_efs_file_system.default_efs_file_system.id}"
  }
}
