# Configura o Provider Google Cloud com o Projeto
provider "google" {
  credentials = file("/vagrant/composite-set-260200-4d0af3f52dea.json")
  project     = var.project_id
  region      = "regiao"
}

 #Cria uma VM com o Google Cloud
resource "google_compute_instance" "helloworld" {
  name         = "estagiario"
  machine_type = var.tipo_da_vm
  zone         = "us-central1-a"

  # Defini a Imagem da VM
  boot_disk {
    initialize_params {
      image = "ubuntu-1804-bionic-v20191113"
 }
   }
	
	 # Habilita rede para a VM com um IP público
  network_interface {
    network = var.network
    access_config {
    }
  }
}

# Cria SQL Gerenciado com Engine MySQL
resource "google_sql_database_instance" "helloworld" {
  name             = "database"
  database_version = "var.versaodb"
  region           = "regiao"

  settings {
    tier = "db-f1-micro"
  }
}