variable "region" {
  description = "The GCP region to deploy resources in."
  type        = string
  default     = "us-central1"
}
variable "project_id" {
  description = "The GCP project ID to deploy resources in."
  type        = string
  default     = "mlops-training-462812"
}
variable "enable_apis" {
  type        = set(string)
  description = "APIs enable in all the projects of the environments"
  default = [ "compute.googleapis.com",
              "aiplatform.googleapis.com",
              "cloudresourcemanager.googleapis.com",
              "containerregistry.googleapis.com",
              "cloudbuild.googleapis.com",
              "artifactregistry.googleapis.com",
              "cloudkms.googleapis.com",
              "storage.googleapis.com",
              "containerscanning.googleapis.com",
            ]
}
