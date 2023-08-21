resource "aws_instance" "terraform-ec2" {
  ami = "${var.ami}"
  instance_type = "t2.micro"
  key_name = "terraform"
  tags = {
    Name = "server terraform"
  }
  vpc_security_group_ids = ["${aws_security_group.webserver_sg.id}"]
 user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y apache2
              echo "<html><body><h1>Hello, World!</h1></body></html>" > /var/www/html/index.html
              systemctl start apache2
  EOF
  
  
}