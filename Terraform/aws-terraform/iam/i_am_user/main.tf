provider "aws" {
 region= "ap-south-1"
 access_key= "AKIAZSG7LV6DKH4INWFS"
 secret_key= "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"
}


resource "aws_iam_user" "testuser" {
  name = "jm"
}
