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

resource "aws_s3_object" "file2" {
  bucket = aws_s3_bucket.frontend.id
  key = "jenkins1.PNG"
  source = "jenkins_deploy_1.PNG"
}

resource "aws_s3_object" "file3" {
  bucket = aws_s3_bucket.frontend.id
  key = "jenkins2.PNG"
  source = "jenkins_deploy_2.PNG"
}

resource "aws_s3_object" "file4" {
  bucket = aws_s3_bucket.frontend.id
  key = "jenkins3.PNG"
  source = "jenkins_deploy_3.PNG"
}


resource "aws_s3_object" "file5" {
  bucket = aws_s3_bucket.frontend.id
  key = "webhook.PNG"
  source = "webhook.PNG"
}

resource "aws_s3_object" "file6" {
  bucket = aws_s3_bucket.frontend.id
  key = "armageddon_proof.PNG"
  source = "armageddon_proof.PNG"
}