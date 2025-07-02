data "google_project" "project" {
}

resource "google_project_iam_policy" "mlops_training_iam_policy" {
  project     = var.project_id
  policy_data = data.google_iam_policy.mlops_training_iam_policy.policy_data
}

data "google_iam_policy" "mlops_training_iam_policy" {
  #  owners
  binding {
    role = "roles/owner"
    members = [ 
      "user:david.mlops.training@gmail.com",
      "serviceAccount:terraform-admin@mlops-training-462812.iam.gserviceaccount.com"
    ]
  }

  binding {
    role = "roles/storage.admin"
    members = [
      "serviceAccount:service-808452778180@gcp-sa-aiplatform.iam.gserviceaccount.com",
      "serviceAccount:808452778180-compute@developer.gserviceaccount.com"
    ]
  }
  binding {
    role = "roles/aiplatform.customCodeServiceAgent"
    members = [
      "serviceAccount:service-808452778180@gcp-sa-aiplatform-cc.iam.gserviceaccount.com",
    ]
  }
  binding {
    role = "roles/cloudbuild.builds.builder"
    members = [
      "serviceAccount:808452778180@cloudbuild.gserviceaccount.com",
    ]
  }
  binding {
    role = "roles/cloudbuild.serviceAgent"
    members = [
      "serviceAccount:service-808452778180@gcp-sa-cloudbuild.iam.gserviceaccount.com",
    ]
  }
  binding {
    role = "roles/containerregistry.ServiceAgent"
    members = [
      "serviceAccount:service-808452778180@containerregistry.iam.gserviceaccount.com",
    ]
  }
  binding {
    role = "roles/pubsub.serviceAgent"
    members = [
      "serviceAccount:service-808452778180@gcp-sa-pubsub.iam.gserviceaccount.com",
    ]
  }
  binding {
    role = "roles/artifactregistry.serviceAgent"
    members = [
      "serviceAccount:service-808452778180@gcp-sa-artifactregistry.iam.gserviceaccount.com",
    ]
  }
  binding {
    role = "roles/cloudkms.serviceAgent"
    members = [
      "serviceAccount:service-808452778180@gcp-sa-cloudkms.iam.gserviceaccount.com",
    ]
  }
  binding {
    role = "roles/aiplatform.serviceAgent"
    members = [
      "serviceAccount:service-808452778180@gcp-sa-aiplatform.iam.gserviceaccount.com",
    ]
  }

}


