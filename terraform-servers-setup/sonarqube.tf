resource "aws_instance" "sonarqube_server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.aws-key.key_name
  vpc_security_group_ids = [aws_security_group.allow_egress.id, aws_security_group.allow_ingress.id, aws_security_group.ingress_k8s.id]

  root_block_device {
    volume_size = var.volume_size
    volume_type = "gp2"
  }

  tags = {
    Name = "Sonarqube server"
  }
  user_data = base64encode(file("scripts/sonarqube-setup.sh"))
}
