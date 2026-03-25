resource "aws_s3_bucket" "frontend" {
  bucket_prefix = "my-jenkins-bucket-"
  force_destroy = true
  

  tags = {
    Name = "Jenkins Bucket"
  }
}


resource "aws_s3_object" "file1" {
  bucket = aws_s3_bucket.frontend.id
  key = "approval.PNG"
  source = "Theo_approval.PNG"
}
