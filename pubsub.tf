resource "google_pubsub_topic" "model_retrain_trigger_topic" {
  project = var.project_id
  name    = "model-retrain-trigger-topic"
  labels  = {
    purpose     = "model-retraining"
  }
}

resource "google_pubsub_topic_iam_member" "scheduler_pubsub_publisher" {
  topic  = google_pubsub_topic.model_retrain_trigger_topic.name
  role   = "roles/pubsub.publisher"
  member = "serviceAccount:service-${var.project_number}@gcp-sa-cloudscheduler.iam.gserviceaccount.com"
}
