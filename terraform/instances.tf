data "template_file" "user_data_public" {
  template = file("${path.module}/userdata/setup_frontend.sh")
  vars = {
    repo_url    = "https://github.com/buiduyhung22103/nextjs-ci-cd"
    backend_dns = aws_instance.backend.private_ip
  }
}

data "template_file" "user_data_private" {
  template = file("${path.module}/userdata/setup_backend.sh")
  vars = {
    repo_url = "https://github.com/buiduyhung22103/nextjs-ci-cd"
    db_host  = aws_db_instance.mysql.address
    db_name  = var.db_name
    db_user  = var.db_username
    db_pass  = var.db_password
  }
}

resource "aws_instance" "frontend" {
  ami                    = data.aws_ami.amazon_linux2.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  key_name               = var.key_pair_name
  vpc_security_group_ids = [aws_security_group.public.id]
  user_data              = data.template_file.user_data_public.rendered
  tags                   = { Name = "counter-frontend" }
}

resource "aws_instance" "backend" {
  ami                    = data.aws_ami.amazon_linux2.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private_a.id
  key_name               = var.key_pair_name
  vpc_security_group_ids = [aws_security_group.private.id]
  user_data              = data.template_file.user_data_private.rendered
  tags                   = { Name = "counter-backend" }
}
