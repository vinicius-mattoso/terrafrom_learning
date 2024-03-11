# AWS Setup and Outputs

Selecionar o provider da AWS com a versão desejada:

```bash
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.19.0"
    }
  }
}
```
Precisamos especificar a região que desejamos utilizar:


```bash
provider "aws" {
  region = var.region
}
```


Vamos criar uma instancia da AWS EC2

```bash
resource "aws_instance" "webserver" {
  ami           = "ami-08d4ac5b634553e16"
  instance_type = var.my_instance_type
}
```

Novo bloco, nesse caso o value é o que queremos fazer o output.
```bash
output "public_ip" {
  value       = aws_instance.webserver.public_ip
  description = "EC2 Public IP"
}
```

In this lab we learn about AWS with Terraform and Terraform Outputs.

## Instructions

1. Create environment variables to connect to AWS

```bash
export AWS_ACCESS_KEY_ID=your_value
export AWS_SECRET_ACCESS_KEY=your_value
```

3. Initialize Terraform Plan, and Terraform Apply

```bash
terraform init
terraform plan
terraform apply --auto-approve
```

Notice the output of Terraform gives us the public IP of the EC2 instance.

4. Examine the `main.tf` file

We are now using the `aws` provider. Also the `output` block is referencing the `public_ip` attribute of the EC2 instance likie this: `aws_instance.webserver.public_ip`

5. Examine the `variables.tf` file

We have 2 variables defined with defaults:
- region
- my_instance_type

6. Check the EC2 instance that got created in the AWS console

7. Now go ahead and destroy the environment.

```bash
terraform destroy --auto-approve
```

> Congratulations you have finished this lab!
