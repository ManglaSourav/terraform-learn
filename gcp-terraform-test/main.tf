

resource "google_compute_instance" "default" {

  name         = "master-vm"
  machine_type = "c4a-standard-4"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      #to see all ubuntu images :   gcloud compute images list --filter ubuntu-os
      image = "ubuntu-2204-jammy-arm64-v20250312"
      size  = 15
    }
  }




  network_interface {
    network = "default"
    access_config {

    }
  }
  metadata = {
    ssh-keys = file("~/.ssh/id_ed25519.pub")
  }
}

# resource "google_compute_instance" "server1" {

#   name         = "server1-vm"
#   machine_type = "c4a-standard-4"
#   zone         = "us-central1-a"

#   boot_disk {
#     initialize_params {
#       #to see all ubuntu images :   gcloud compute images list --filter ubuntu-os
#       image = "ubuntu-2204-jammy-arm64-v20250312"
#       size  = 15
#     }
#   }

#   network_interface {
#     network = "default"
#     access_config {

#     }
#   }
#   metadata = {
#     ssh-keys = file("~/.ssh/id_ed25519.pub")
#   }
# }

# resource "google_compute_instance" "server2" {

#   name         = "server2-vm"
#   machine_type = "c4a-standard-4"
#   zone         = "us-east1-b"

#   boot_disk {
#     initialize_params {
#       #to see all ubuntu images :   gcloud compute images list --filter ubuntu-os
#       image = "ubuntu-2204-jammy-arm64-v20250312"
#       size  = 15
#     }
#   }

#   network_interface {
#     network = "default"
#     access_config {

#     }
#   }
#   metadata = {
#     ssh-keys = file("~/.ssh/id_ed25519.pub")
#   }
# }
# resource "google_compute_instance" "server3" {

#   name         = "server3-vm"
#   machine_type = "c4a-standard-4"
#   zone         = "us-east1-b"

#   boot_disk {
#     initialize_params {
#       #to see all ubuntu images :   gcloud compute images list --filter ubuntu-os
#       image = "ubuntu-2204-jammy-arm64-v20250312"
#       size  = 15
#     }
#   }

#   network_interface {
#     network = "default"
#     access_config {

#     }
#   }
#   metadata = {
#     ssh-keys = file("~/.ssh/devops-key.pem.pub")
#   }
# }

# resource "google_compute_network" "custom" {
#   name                    = "my_network"
#   auto_create_subnetworks = false
# }

# resource "google_compute_subnetwork" "custom" {

#   name          = "my-subnet"
#   ip_cidr_range = "10.0.1.0/24"
#   region        = "us-central1"
#   network       = google_compute_network.custom.id
# }


# resource "google_compute_instance" "custom_subnet" {
#   name         = "my-vm-instance"
#   tags         = ["allow-ssh"]
#   zone         = "europe-west1-b"
#   machine_type = "e2-small"
#   network_interface {
#     network    = google_compute_network.custom.id
#     subnetwork = google_compute_subnetwork.custom.id
#   }
#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-12"
#     }
#   }
# }

