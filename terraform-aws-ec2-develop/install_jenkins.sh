#!/bin/bash

sudo yum update –y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y
sudo amazon-linux-extras enable ansible2
sudo yum install jenkins java-openjdk11 ansible git -y
sudo systemctl daemon-reload
sudo systemctl start jenkins
sudo systemctl status jenkins