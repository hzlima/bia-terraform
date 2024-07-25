resource "aws_instance" "bia-dev" {
  ami = "ami-02f3f602d23f1659d"
  instance_type = "t3.micro"

  tags = {
    ambiente = "dev"
    Name = "bia-dev"
   
  }

  vpc_security_group_ids = [aws_security_group.bia-dev.id]
  
  root_block_device {
    volume_size = 8
  }

  iam_instance_profile = aws_iam_instance_profile.role-acesso-ssm.name

  user_data = "${file("userdata_biadev.sh")}"
}