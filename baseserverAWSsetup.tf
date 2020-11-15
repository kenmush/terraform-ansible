terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region = "us-east-1"
  access_key = "AKIAJEPE4GMSQSYDCEGQ"
  secret_key = "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"
}

resource "aws_key_pair" "deployer" {
  key_name = uuid()
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCm/aWMMyAvKmY24+F6eMqmk3LPGFUGNQRoHUXYZjVx+Uu7sZNGlyyapjix9FpkBA+IwwxhXDwEhO8JjnxMD+bI7v1fYi5p3/EaniHhin+LHehEcyxyjT7ik2mcQzd2hxlXk/8sz1xO4AxzOn7iyMcFCvQ1Y+LfHrINJ9iRKepEkRy8/gEq7xyZiZjBQyMe3IRl6joJb3c5tseQFwtkzSCQCtx2s+z5Zs/+bilmlvN1E8ppadf3EOnieA51JlIrXRVdqQKanpWkNyTgYhWw1plvvRrvSn3oPnE1xTOQ0a5Nj/fq9MhR4KHfrpSoCq3bIzckXc3pL4kgfLmMh3wckNF27fa0irbJ0Ktzt+noftxSEghzlYypTWkzrenoPcmdKlcUsH94o6Yms0PDJv8/gz/1nQcCnrxonZACVF+x7WZlG0ZZglFhGBO9hQtrPBNI8vipyDVPk30N8PX0AvTmHa2HYSNyLNb0lnHGdbBlFrJfsz+XSDI4OayOhWmq8LfHKvu6fPU2zlzH2+1losVcyPwoIYO+wuUsaDtPqv9gMNcfOblQo9lWySBqDLXbvlFm0bswpwfdxgaXM8NoCGRUrhqPZboxSnrMqBxwG85YgIEkueP1D16MNdkbX37SkA+CUgrOEtYbNeXh5Sed3x6ZMBRYEutXgItlM9TIDP52mlbKQw== kenmsh@gmail.com"
}
resource "aws_security_group" "http_security_group" {
  name = "Allow HTTP"
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}
resource "aws_security_group" "https_security_group" {
  name = "Allow HTTPS"
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}
resource "aws_security_group" "ssh_security_group" {
  name = "Allow SSH"
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}

resource "aws_instance" "app_server" {
  depends_on = [
    aws_security_group.http_security_group,
    aws_security_group.ssh_security_group,
    aws_security_group.https_security_group]

  ami = "ami-0885b1f6bd170450c"
  instance_type = "t2.micro"
  key_name = aws_key_pair.deployer.key_name
  associate_public_ip_address = true

  security_groups = [
    aws_security_group.http_security_group.name,
    aws_security_group.https_security_group.name,
    aws_security_group.ssh_security_group.name]
  tags = {
    Name = "Application Server"
  }

  provisioner "remote-exec" {
    inline = [
      "echo KEN"
    ]

    connection {
      type = "ssh"
      host = self.public_ip
      user = "ubuntu"
      port = 22
      private_key = file("${path.root}/ken")
    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook -u ubuntu -i '${self.public_ip},' -T 120 --private-key ken playbook.yml"
  }

}

output "instance_ip_addr" {
  value = aws_instance.app_server.public_ip
  description = "Public IP"
}
output "instance_security_group" {
  value = aws_instance.app_server.security_groups
  description = "Security Group"
}