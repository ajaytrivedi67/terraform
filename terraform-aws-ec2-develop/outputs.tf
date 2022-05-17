output "jenkins_hostname" {
  value       = aws_instance.jenkins.public_dns
  description = "Public DNS name for jenkins instance"
}


output "jenkins_network_interface_id" {
  value       = aws_instance.jenkins.primary_network_interface_id
  description = "Elastic Network Interface (ENI) ID of the jenkins instance's primary network interface"
}

