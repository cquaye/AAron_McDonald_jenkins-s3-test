resource "aws_s3_bucket" "frontend" {
  bucket_prefix = "my-jenkins-bucket-"
  force_destroy = true


  tags = {
    Name = "Jenkins Bucket"
  }
}


#---permissions for public access---#    
resource "aws_s3_bucket_public_access_block" "s3_permissions" {
  bucket = aws_s3_bucket.frontend.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = false

}


#---versioning ---#  
resource "aws_s3_bucket_versioning" "se_versioning" {
  bucket = aws_s3_bucket.frontend.id
  versioning_configuration {
    status = "Enabled"
  }
  
}

resource "aws_s3_object" "file1" {
  bucket = aws_s3_bucket.frontend.id
  key    = "approval.PNG"
  source = "Theo_approval.PNG"
}

resource "aws_s3_object" "file2" {
  bucket = aws_s3_bucket.frontend.id
  key    = "jenkins1.PNG"
  source = "jenkins_deploy_1.PNG"
}

resource "aws_s3_object" "file3" {
  bucket = aws_s3_bucket.frontend.id
  key    = "jenkins2.PNG"
  source = "jenkins_deploy_2.PNG"
}

resource "aws_s3_object" "file4" {
  bucket = aws_s3_bucket.frontend.id
  key    = "jenkins3.PNG"
  source = "jenkins_deploy_3.PNG"
}


resource "aws_s3_object" "file5" {
  bucket = aws_s3_bucket.frontend.id
  key    = "webhook.PNG"
  source = "webhook.PNG"
}

resource "aws_s3_object" "file6" {
  bucket = aws_s3_bucket.frontend.id
  key    = "armageddon_proof.PNG"
  source = "armageddon_proof.PNG"
}