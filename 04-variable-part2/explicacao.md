# Arquivos contidos

1- Arquivo principal (`main.tf`)
2- Aqruivo para conter as variáveis a serem utilizadas (`variables.tf`)
3- Aqruivo para fazer a passagem de valores para as variáveis (`terraform.tfvars`)

Não tem problema separar em varios arquivos pois quando o terraform rodar ele vai fazer um merge de todos os arquivos.


```bash
terraform init
terraform plan
terraform apply
```

Ao terminar de utilizar pode fazer o destroy

```bash
terraform destroy 
```