# Comandos básicos

* fonte: https://github.com/samgabrail/terraform-for-beginners



## Comandos usuais

1. Change directory into the 01-Basic-Commands directory:

```bash
terraform version
terraform -help
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy
terraform output
```

Explicação a respeito de cada comando:

- `terraform version:` Comando para exibir a versão do terraform que está instalada na máquina.

- `terraform -help:` Comando para exibir uma lista de comandos e opções disponíveis no terraform.

- `terraform init:` Comando para inicializar, fazer o download e instalar todos os plugins necessários além de configurar o backend.

- `terraform fmt:` Comando utilizado para formatar os arquivos .tf para ficar com um padrão de identação.

- `terraform validate:` Comando para validar se todos os comandos estão coerentes com relação a sintax e já previne erros iniciais.

- `terraform plan:` Comando para criar o plano de execução necessário, exibindo as etpas que irão ser feitas.

- `terraform apply:` Comando para executar o plano de ação previamente criado.

- `terraform output:` This command displays the outputs of your Terraform configuration. It is used to retrieve the values of any output variables that were defined in your Terraform code.

2. Conferindo se ocorreu tudo certo

```bash
docker ps
docker images
```

3. Verificando por meio do browser

Abra a porta 8080 que foi pareada com a porta 80 do container.

4. Destroir todo o ambiente criado de uma única vez

```bash
terraform destroy
```

## Lab Code Explanation

Terraform is an infrastructure-as-code tool that allows you to define and manage infrastructure resources in a declarative way. This Terraform configuration sets up a Docker container running the Nginx web server with port forwarding from port 8080 on the host machine to port 80 inside the container.


Let's go through the code line by line:

```hcl
terraform {
  required_providers {          # The `required_providers` block specifies the provider(s) needed for this Terraform configuration.
    docker = {                  # Here, we are requiring the `docker` provider.
      source  = "kreuzwerker/docker"   # This line specifies the source of the provider. In this case, it is the `kreuzwerker/docker` provider.
      version = "3.0.1"                # This line specifies the version of the provider that we need.
    }
  }
}

provider "docker" {}           # This `provider` block specifies that we want to use the `docker` provider.

resource "docker_image" "nginx_image" {    # This `resource` block creates a Docker image named `nginx_image` using the `nginx:1.23.3` image.
  name = "nginx:1.23.3"
}

resource "docker_container" "nginx_container" {  # This `resource` block creates a Docker container named `nginx_container` based on the `nginx_image` image.
  name  = "web-server"                         # This line specifies the name of the container.
  image = docker_image.nginx_image.image_id     # This line references the `nginx_image` resource created earlier to get the image ID.
  ports {                                       # This block specifies the ports to be exposed by the container.
    internal = 80                               # The container's internal port 80 will be exposed.
    external = 8080                             # The container's internal port 80 will be accessible on the host's port 8080.
  }
}
```