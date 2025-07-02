resource "google_vertex_ai_endpoint" "my_endpoint" {
  name         = "house-price-prediction-endpoint"
  display_name = "house-price-prediction-endpoint"
  location     = var.region
}
