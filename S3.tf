# Crear bucket S3 para almacenar archivos de configuración o ambiente
resource "aws_s3_bucket" "env_file_bucket" {
  bucket = "${var.env_file_bucket_name}-${var.project_name}"

  tags = {
    Name = "${var.project_name}-${var.environment}-env-bucket"
  }
}