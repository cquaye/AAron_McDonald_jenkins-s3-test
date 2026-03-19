resource "aws_s3_bucket" "frontend" {
  bucket_prefix = "my-jenkins-bucket-"
  force_destroy = true
  

  tags = {
    Name = "Jenkins Bucket"
  }
}