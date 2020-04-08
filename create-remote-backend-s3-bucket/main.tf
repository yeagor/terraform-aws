provider "aws" {
  profile = var.profile
  region = var.region
}

resource random_uuid uuid { }

resource "aws_s3_bucket" remote_backend_bucket {
  bucket = "terraform-remote-backend-${random_uuid.uuid.result}"
  region = var.region
}
