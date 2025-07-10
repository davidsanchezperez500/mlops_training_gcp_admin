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
      "serviceAccount:terraform-admin@${var.project_id}.iam.gserviceaccount.com",
      "user:david.mlops.training@gmail.com",
    ]
  }

  binding {
    role = "roles/editor"
    members = [ 
      "serviceAccount:github-runner-service-account@${var.project_id}.iam.gserviceaccount.com",
      "serviceAccount:${var.project_number}-compute@developer.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/editor"
    members = [ 
      "serviceAccount:github-runner-service-account@mlops-training-462812.iam.gserviceaccount.com"
    ]
  }

  binding {
    role = "roles/storage.admin"
    members = [
      "serviceAccount:service-${var.project_number}@gcp-sa-aiplatform.iam.gserviceaccount.com",
      "serviceAccount:${var.project_number}-compute@developer.gserviceaccount.com",
      "serviceAccount:service-${var.project_number}@gcf-admin-robot.iam.gserviceaccount.com"
    ]
  }
  binding {
    role = "roles/aiplatform.customCodeServiceAgent"
    members = [
      "serviceAccount:service-${var.project_number}@gcp-sa-aiplatform-cc.iam.gserviceaccount.com",
    ]
  }
  binding {
    role = "roles/cloudbuild.builds.builder"
    members = [
      "serviceAccount:${var.project_number}@cloudbuild.gserviceaccount.com",
    ]
  }
  binding {
    role = "roles/cloudbuild.serviceAgent"
    members = [
      "serviceAccount:service-${var.project_number}@gcp-sa-cloudbuild.iam.gserviceaccount.com",
    ]
  }
  binding {
    role = "roles/containerregistry.ServiceAgent"
    members = [
      "serviceAccount:service-${var.project_number}@containerregistry.iam.gserviceaccount.com",
    ]
  }
  binding {
    role = "roles/pubsub.serviceAgent"
    members = [
      "serviceAccount:service-${var.project_number}@gcp-sa-pubsub.iam.gserviceaccount.com",
    ]
  }
  binding {
    role = "roles/artifactregistry.serviceAgent"
    members = [
      "serviceAccount:service-${var.project_number}@gcp-sa-artifactregistry.iam.gserviceaccount.com",
    ]
  }
  binding {
    role = "roles/cloudkms.serviceAgent"
    members = [
      "serviceAccount:service-${var.project_number}@gcp-sa-cloudkms.iam.gserviceaccount.com",
    ]
  }
  binding {
    role = "roles/aiplatform.serviceAgent"
    members = [
      "serviceAccount:service-${var.project_number}@gcp-sa-aiplatform.iam.gserviceaccount.com",
    ]
  }
  binding {
    role = "roles/iam.serviceAccountUser"
    members = [
      "serviceAccount:${var.project_number}-compute@developer.gserviceaccount.com",
    ]
  }
  binding {
    role = "roles/aiplatform.user"
    members = [
      "serviceAccount:${var.project_number}-compute@developer.gserviceaccount.com",
    ]
  }
  binding {
    role = "roles/artifactregistry.reader"
    members = [
      "serviceAccount:${var.project_number}-compute@developer.gserviceaccount.com",
    ]
  }
  binding {
    role = "roles/cloudbuild.serviceAgent"
    members = [
      "serviceAccount:${var.project_number}@cloudbuild.gserviceaccount.com",
    ]
  }
  binding {
    role = "roles/cloudfunctions.serviceAgent"
    members = [
      "serviceAccount:service-${var.project_number}@gcf-admin-robot.iam.gserviceaccount.com",
    ]
  }
  binding {
    role = "roles/run.serviceAgent"
    members = [
      "serviceAccount:service-${var.project_number}@serverless-robot-prod.iam.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/eventarc.serviceAgent"
    members = [
      "serviceAccount:service-${var.project_number}@gcp-sa-eventarc.iam.gserviceaccount.com",
    ]
  }


  depends_on = [ google_project_service.project ]
}


