# Creación de la VPC
resource "google_compute_network" "ansible-vpc" {
  name                    = "ansible-vpc"
  auto_create_subnetworks = false
}

#Creacion de la subred publica 
resource "google_compute_subnetwork" "public" {
  name = "public"
  ip_cidr_range = "10.10.50.0/24"
  region = "us-east1"
  network = google_compute_network.ansible-vpc.id
}

#Creacion de la subred privada 
resource "google_compute_subnetwork" "private" {
  name = "private"
  ip_cidr_range = "10.10.10.0/24"
  region = "us-east1"
  network = google_compute_network.ansible-vpc.id
}

#creando el servicio Cloud Routers 
resource "google_compute_router" "router" {
  name = "router"
  network = google_compute_network.ansible-vpc.id
  region = "us-east1"
  bgp {
    asn = 64514
    advertise_mode = "CUSTOM"
  }
}  


#creando el servicio Cloud NAT gw para la red privada
resource "google_compute_router_nat" "nat" {
  name = "nat"
  router = google_compute_router.router.name
  region = google_compute_router.router.region
  nat_ip_allocate_option = "AUTO_ONLY"  
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name = "private"
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}  


#hasta aqui funciona: se crearon las 3 instancias con sus respectivas IPs y firewall permitido al SSH, 
#los Slaves, si tienen salida a internet para instalar sus paqueterias