resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins"
  description = "Allow Jenkins Traffic"
  vpc_id      =  "vpc-0c48111479bc06649"

  ingress {
    description      = "Allow from Personal CIDR block"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "Allow SSH from Personal CIDR block"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = merge(

    {
      Name        = var.name,
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}


resource "aws_security_group" "tomcat_sg" {
  name        = "tomcat_sg"
  vpc_id      =  "vpc-0c48111479bc06649"
  ingress {
    description      = "Allow SSH from Personal CIDR block"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["172.20.0.0/24"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = merge(

    {
      Name        = var.name,
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
  }




resource "aws_key_pair" "jenkins" {
  key_name   = "jenkins"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDADHRzHbnMLfIDMQV2VrUYbL7oA7GQDdKN1sp3GbKLYr2b5KZbvh8+w6dqT46blmvOrEdGlIzNlMJM2NXI7yC9S6gYhK2+esOoDXukI+xngYBbJJfr9PswgqbwAoXCPs6bga45GingBDPtw7ynE/R0CjF58lsoG3M5j1tVo+qDstqIdRbSHCfHznqmGxymuj+02neeNy9CWBeBbyiM72U/7jFLb8BaPMDBwuqfnTqsuVZ9ayTSg9irQYUQU2W/caqWq6SFKfIBK6+GW7bLTHz5FUJ1MMR3/RF/q+8T7RcYoY8j2faIkniR5JKjtkK8bbdZc6HNzVUo67nLnofs6OJMpEEFk/eY3db45eywqaWH7AnrNCEKRtLKcv9t2kWykLBQDfmpLIjFlWSVg40yfxEAlDD25+WEvSmKxzSmRXt44dqPkTJxoyZaSyuKWKKgBKUpxQ5Po7HOd+Q+gctroTO4WEXDdgZi/CYM38IiihZGMC0JEizg8oQEfMKzt4Keid0="
}

resource "aws_instance" "jenkins" {
  ami                         = var.jenkins_ami
  availability_zone           = var.availability_zones[0]
  instance_type               = var.jenkins_instance_type
  key_name                    = var.key_name
  monitoring                  = true
  subnet_id                   = var.sg_pub_id
  security_groups             = [aws_security_group.jenkins_sg.id]
  user_data                   = "${file("/Users/ajaytrivedi/Downloads/terraform-aws-ec2-develop/install_jenkins.sh")}"
  associate_public_ip_address = true

  tags = merge(
    {
      Name        = var.name,
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_instance" "privateinstance" {
  ami                         = var.jenkins_ami
  availability_zone           = var.availability_zones[0]
  associate_public_ip_address = false
  instance_type               = var.jenkins_instance_type
  key_name                    = var.key_name
  subnet_id                   = var.sg_priv_id
  vpc_security_group_ids      = [aws_security_group.tomcat_sg.id]

 tags = merge(
    {
      Name = var.privat_ins_name
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}
