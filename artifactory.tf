resource "google_artifact_registry_repository" "repository_docker" {
  location      = var.region
  repository_id = "docker-repository"
  description   = "Docker repository"
  format        = "DOCKER"
  kms_key_name  = "projects/${var.project_id}/locations/${var.region}/keyRings/key-ring-artifact-repo2/cryptoKeys/key-artifact-repo2"
  vulnerability_scanning_config {
    enablement_config = "INHERITED"
  }
  depends_on = [
    google_kms_crypto_key_iam_binding.crypto_key_artifact_registry_repository
  ]
}

resource "google_kms_key_ring" "keyring_artifact_registry_repository" {
  name     = "key-ring-artifact-repo2"
  location = var.region
}

resource "google_kms_crypto_key" "key_artifact_registry_repository" {
  name            = "key-artifact-repo2"
  key_ring        = google_kms_key_ring.keyring_artifact_registry_repository.id
  rotation_period = "100000s"
}

resource "google_kms_crypto_key_iam_binding" "crypto_key_artifact_registry_repository" {
  crypto_key_id = google_kms_crypto_key.key_artifact_registry_repository.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

  members = [
    "user:david.mlops.training@gmail.com",
    "serviceAccount:terraform-admin@mlops-training-462812.iam.gserviceaccount.com",
    "serviceAccount:service-808452778180@gcp-sa-artifactregistry.iam.gserviceaccount.com"
  ]
}

