provider "aws" {
 region= "ap-south-1"
 access_key= "AKIAZSG7LV6DKH4INWFS"
 secret_key= "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"
}


resource "aws_s3_bucket" "bucket" {
  bucket = "devopsmybucket23022023"

  }
resource "aws_s3_bucket_object" "financedata2308" {
  bucket = aws_s3_bucket.bucket.id
  key    = "finance-2023.doc"
}
