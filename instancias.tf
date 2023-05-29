resource "google_compute_instance" "rocky-linux-instance1" {
  name         = "master01"
  machine_type = "e2-medium"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "rocky-linux-cloud/rocky-linux-8"
      labels = {
        my_label = "value"
      }
    }
  }
  network_interface {
    network = "ansible-vpc"
    subnetwork = google_compute_subnetwork.private.id
    network_ip = "10.10.10.2" 

    access_config {
      // Se autoasignará una IP Publica dinamica
    }
  }
}



resource "google_compute_instance" "rocky-linux-instance2" {
  name         = "slave01"
  machine_type = "e2-medium"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "rocky-linux-cloud/rocky-linux-8"
      labels = {
        my_label = "value"
      }
    }
  }
  network_interface {
    network = "ansible-vpc"
    subnetwork = google_compute_subnetwork.private.id
    network_ip = "10.10.10.3" 
  }
}


resource "google_compute_instance" "rocky-linux-instance3" {
  name         = "slave02"
  machine_type = "e2-medium"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "rocky-linux-cloud/rocky-linux-8"
      labels = {
        my_label = "value"
      }
    }
  }
  network_interface {
    network = "ansible-vpc"
    subnetwork = google_compute_subnetwork.private.id
    network_ip = "10.10.10.4" 
      }
}



