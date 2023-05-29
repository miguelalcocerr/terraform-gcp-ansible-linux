# Habilita las reglas de firewall para permitir la conexión SSH
resource "google_compute_firewall" "firewall-allow-ssh" {
  name    = "name-firewall-allow-ssh"
  network = google_compute_network.ansible-vpc.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

#  source_tags = ["web"]
source_ranges = ["0.0.0.0/0"]
}


#resource "google_compute_network" "ansible-vpc" {
#  name = "ansible-vpc"
#}
