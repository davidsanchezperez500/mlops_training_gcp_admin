# resource "google_cloud_scheduler_job" "model_retrain_scheduler" {
#   project    = var.project_id
#   region     = var.region
#   name       = "model-retrain-scheduler"
#   description = "Programa el reentrenamiento del modelo de precios de casas"
#   schedule = "0 0 * * *" 

#   # Configuración del mensaje de Pub/Sub
#   pubsub_target {
#     topic_name = google_pubsub_topic.model_retrain_trigger_topic.id
#     data       = base64encode(jsonencode({
#       action    = "retrain_model",
#       timestamp = "$${time.strftime('%Y%m%d-%H%M%S')}" 
#     }))
#   }
# }
