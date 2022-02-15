provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "25d1232fbdf5e24005bef446cb908b95dcc73ee3"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2022-02-15 20:31:30"
    git_last_modified_by = "99744293+t1clausen@users.noreply.github.com"
    git_modifiers        = "99744293+t1clausen"
    git_org              = "t1clausen"
    git_repo             = "terragoat"
    yor_trace            = "0c8aec3d-01ba-4c4b-b85a-bf74719138b8"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "25d1232fbdf5e24005bef446cb908b95dcc73ee3"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2022-02-15 20:31:30"
    git_last_modified_by = "99744293+t1clausen@users.noreply.github.com"
    git_modifiers        = "99744293+t1clausen"
    git_org              = "t1clausen"
    git_repo             = "terragoat"
    yor_trace            = "2d699ff4-4855-4504-9daa-35d32f676d60"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
