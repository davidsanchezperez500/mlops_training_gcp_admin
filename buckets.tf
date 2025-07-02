resource "google_storage_bucket" "mlops_training_models_for_training" {
  name          = "mlops-training-models-for-training-46281"
  storage_class = "REGIONAL"
  location      = var.region
  versioning {
    enabled = true
  }
}
