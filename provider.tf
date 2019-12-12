# Configura o Provider Google Cloud com o Projeto
provider "google" {
  credentials = file("/vagrant/composite-set-260200-4d0af3f52dea.json")
  project     = var.project_id
  region      = var.regiao
 }
